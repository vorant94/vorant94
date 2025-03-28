# Pitfalls of AWS Amplify Serverless containers

*Recently I've got a task that led me to exploring AWS Amplify Serverless Containers and I would like to share with you the experience I earned from it. I built a small Angular app that allows to convert Word files into PDF*

---

## Starting point

In order to get to the point of serverless containers let's assume we have an Angular project that is configured with AWS according to [this guide](https://docs.amplify.aws/start/q/integration/angular/). After the project is initialized it needs also to be configured to allow advanced workflows by running `aws configure project`.

## File converter API

The API that I chose to implement in the scope of this app is [Gotenberg](https://gotenberg.dev/). It is basically a wrapper on top of the LibreOffice API distributed as a nice stateless Docker container, what makes it a perfect candidate for our purpose.

## First try (or DeploymentAwaiter problem)

I started by adding a new api with `amplify add api` and followed by `REST -> API Gateway + AWS Fargate (Container-based)`. CLI gave me a couple of templates that I am supposed to select from. I chose a custom one and continued with other configuration (for testing purpose I didn't restrict access to the API).

Gotenberg provides a simple docker compose [example](https://gotenberg.dev/docs/get-started/docker-compose) of how to add it to your stack, so I copied it to the project and added mapping of ports (since I want the API to be exposed on port 80 and not 3000). At this point of time compose file looks like this:

```yaml
version: "3"

services:
  gotenberg:
    image: gotenberg/gotenberg:7
    ports:
      - 80:3000
```

I ran it locally to make sure everything is working as expected and after it ran `amplify push` to push changes to cloud... only to get `CREATE_FAILED` status on some inner DeploymentAwaiter resource which I'm not even aware of.

Now lets fast-forward half a day me playing "Spot 5 differences!" with out-of-the-box examples (particularly with "Docker Compose - ExpressJS + Flask template") that are working by the way perfectly I noticed that syntax of the given compose file doesn't use `image` statement, but `build` instead, e.g. it goes like this:

```yaml
version: "3.8"

services:
  express:
  build:
    context: ./express
    dockerfile: Dockerfile
  ports:
    - "8080:8080"
  networks:
    - public
    - private

python:
  build:
    context: ./python
    dockerfile: Dockerfile
  networks:
    - public
    - private
  ports:
    - "5000:5000"

networks:
  public:
  private:
```

And ExpressJS Dockerfile, that was also generated by Amplify CLI, looks like this:

```dockerfile
FROM public.ecr.aws/bitnami/node:14-prod-debian-10

ENV PORT=8080
EXPOSE 8080

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install
COPY ../en .

CMD [ "node", "index.js" ]
```

Nothing special, it is a common instructions to bundle NodeJS applications with Docker and all steps make sense. In my case I don't need to modify publicly available image of Gotenberg. But when you are playing "Spot 5 differences!", you need to do weird stuff from time to time, so I decided to try and add a dummy Dockerfile, that just extends Getenberg image and runs it. It goes as followed:

```dockerfile
FROM gotenberg/gotenberg:7

EXPOSE 3000

CMD [ "gotenberg" ]
```

Updated compose file looks like this

```yaml
version: "3"

services:
	gotenberg:
		build:
			context: ./gotenberg
			dockerfile: Dockerfile
		ports:
			- 80:3000
```

I ran `amplify push`, got another DeploymentAwaiter error, removed an API to clear any potential consequences of previous `amplify push` runs, added it again, pushed and now Gotenberg is deployed!

## Second try (or Service is Unavailable problem)

Now I was able to connect to our API with a URL that Amplify CLI printed to output, and it resulted in Service Unavailable error, so...

Fast-forward another half a day me reading the same one-page guide for serverless containers from above and playing the same "Spot 5 differences!" game with ExpressJS + Flask template. In the end I noticed that in the template ExpressJS has port 8080 and Flask - 5000 e.g. no service is exposed at 80 port... Also in the guide it says that all services of API are deployed as a single Fargate instance, so obviously there are a lot of distinctions from how services are deployed via Docker itself and via Amplify CLI.

So I decided to do a weird thing once more and despite that I want the API to be available on 80 port make port mapping like 3000:3000 (and also add both private and public networks like in template just in case) and it worked! I can now access Gotenberg and utilize all its features! Hooray!

But at what cost? (c)

## Conclusion

After all it was a little hard experience since the guide itself references official Docker documentation, but the basic knowledge of it actually leads the user to errors with unclear error messages. Overall the feeling is that if you code exactly the way that Amplify templates say everything kinda works, but one step left or one step right and you are lost. I don't think that i'll use in production AWS Amplify Serverless Containers at least for now, but I'll keep an eye on it.
