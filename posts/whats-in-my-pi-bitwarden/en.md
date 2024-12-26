![Bitwarden logo](cover.webp)

# [What’s in my Pi?]: Bitwarden

*A couple of years ago I bought myself a Raspberry Pi and using it as a home server hosting there a bunch of different apps. The whole setup went through several iterations and is still evolving. I'd like to share with you what I have there and how it is helping me in my day-to-day life. There will be several posts in order to make it more readable, so keep in touch*

---

There are multiple options to store your passwords nowadays. I suppose that the default option for an average modern user is either to have only one password for everything or to store all of the passwords in a browser since it constantly suggests to autofill them:

- The main problem of having only one password is that not all your internet accounts are equally protected. Most likely you also use the same email address everywhere. A common way of hacking user email account like Gmail, which has a strong protection, is to hack some small less-protected buggy site, find there an account with the targeted email address and try to use this password in Gmail. After the hacker has access to your email account it can reset any of your passwords on other sites by using "Forgot password?" functionality. And now all of your internet accounts alongside with credit card information are hacked.
- the built-in browser password manager is a better choice, but for me it means vendor-lock since I swap browsers from time to time and I want my passwords to be stored independently of currently used browser.

> **Whining minute**: modern browsers IMHO should become way more modular, they should not do all at once, they should allow to integrate all at once. Hence password manager should not be built-in, but there should be option to use external one without need for custom browser plugins.

## In the beginning... there was 1Password

At first many years ago I migrated to [1Password](https://1password.com/) and it was really nice experience. It is a standalone subscription-based password manager that exceptionally well integrates itself into both MacOS and iOS. It is even frequently promoted by Apple when they want to demonstrate the amount of apps of their ecosystem. The main problem for me with it was its monetization approach. While subscription is not active the user can't create/update new records or autofill existing ones. He/she still can view already created ones and copy-paste them manually, without those capabilities being free 1Password would be easy no-go for me, but still... Let's be clear, how many new accounts do you need to create each month? I usually don't do a lot. Payment for autofill is just artificial boundary, so what should I pay for on a monthly basis? For the storing the data on their cloud infrastructure? I doubt it cost what they ask for. I'm sure if it was one-time payment I would be still using this app, but it is not an option.

There are a lot of free open-source password managers, but those I saw are usually don't have cross-device sync or poorly integrated with OS. It is a common situation for open source software since it is written by volunteer programmers in their free time.

## Here comes the savior

So once I bought Raspberry Pi I found a good alternative for 1Password, it is called [Bitwarden](https://bitwarden.com/). From the functionality that I personally use they are pretty equal, there is no such a thing that I used in 1Password, but is in lack in Bitwarden. From the design perspective 1Password is indeed prettier, but Bitwarden is free when you self-host it. So instead of paying for storing my passwords in the cloud, I'm running my own instance of Bitwarden and connecting iOS and MacOS clients to it. As with all other my Pi apps there is a trade-off of being unable to connect to server outside the home (without VPN). But thankfully all of the Bitwarden apps I used are offline-first: once they synced their data with server, user can disconnect from it, all the synced records are still accessible within the app.

Deployment of Bitwarden server itself can be a little bit hard thing to do from what I remember. It is composed from several different modules, which needs to be configured separately. You also need to connect an SMTP email server, so your Bitwarden instance would be able to send different sorts of confirmation emails. And even after all of it you still need to get API key from their site even for self-hosted option. Obviously all this mess is overkill for a small personal password manager, it is meant to be used for bit tech companies, who wants their employees to be secure, but also don't want to put their data into different company's cloud.

But since the server is open-source, there is already a solution to it. One of the good people out there implemented a lightweight alternative called [Vaultwarden](https://github.com/dani-garcia/vaultwarden) that is fully compatible with official Bitwarden clients, but consists only from one module and doesn't require SMTP server or API keys. So this is what I use in practice.

## HTTPS hassle

As I previously said some apps required me to dive into setting up HTTPS connection to my Pi even though nothing is going outside a home network. Bitwarden is one of them although it is not the one to blame. According to this [GitHub issue](https://github.com/dani-garcia/vaultwarden/discussions/2274) it happens that it uses some browser crypto functionality and browser forces user to have HTTPS in order to enable this functionality.

For a time being I used Bitwarder without web-interface. I don't really remember whether Bitwarden desktop client worked as usual or not. After all it is built with [Electron](https://www.electronjs.org), so it is just a Chromium with a website built-in, but I don't remember here any issues.

The solution of this problem for me was to hide all of the apps I use behind a reverse proxy server and set-up HTTPS at this proxy level. There is a web-server called [Nginx](https://www.nginx.com), that I'm familiar with from work, so I went with it.

> A reverse proxy is a server, app, or cloud service that sits in front of one or more other web servers to intercept
> and inspect incoming client requests before forwarding them to the web server and subsequently returning the server's
> response to the client.

The last thing that I needed to accomplish for HTTPS connection is a SSL certificate. The thing is HTTPS connection actually consists of two features:

- first and foremost it is encryption of requests and responses, so no middle-man like your Internet provider can read or modify the data you send via Internet.
- secondly it means site owner identity verification, so the only company that can get SSL certificate for `https://facebook.com/` is the one that can actually prove itself being/owning Facebook.

The encryption is the only thing that I need and while there are a couple of SSL certificate authorities that provide certificates without verification I didn't succeed to generate SSL certificate for the local network address `https://pi.lan/`

> All addresses ending with `.lan` are considered local network addresses, hence you cannot publish the site to Internet
> that ends with `.lan` domain, hence you cannot generate a certificate for it...

I ended up finding a way to create my own "authority" and generate certificate with it. Since it was not a real authority I needed to manually add it to trust-list at all my devices. In conjunction with Nginx it was good enough for browsers to enable crypto stuff and Bitwarden web client started to work as expected.

## I have a garage car without a garage

We will come back to HTTPS topic later once more, but for now this is it. As you see there are a lot of work needs to be done, when you want to self-host apps, but as long as I can do it incrementally and still benefit from each iteration it pays off for me with the feeling of accomplishment. After all my Pi - is programmers alternative to having a garage with a car, that you regularly spent time fixing even though you could bring it to service.

## Bonus

One additional thing to mention is that regardless of the size of company, regardless of how much money they spend to be as secure as possible, once the thing is in the cloud you cannot be 100% protected from malicious attacks. Even if data is encrypted in such way that it is useless after being hacked, still making attack surface as small as possible is the best security strategy. And what can be more secure than hosting the server inside your local network without access to the Internet? So I'm sure that Bitwarden / Vaultwarden setup is not only cheaper that everything I used before, but also more secure by definition.

## P.S.

There is also very interesting [password game](https://neal.fun/password-game/), that I think you should give a shot to😎
