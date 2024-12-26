![FreshRSS logo](cover.webp)

# [What’s in my Pi?]: FreshRSS

*A couple of years ago I bought myself a Raspberry Pi and using it as a home server hosting there a bunch of different apps. The whole setup went through several iterations and is still evolving. I'd like to share with you what I have there and how it is helping me in my day-to-day life. There will be several posts in order to make it more readable, so keep in touch*

---

Back in the old days when there were no social networks if you wanted to have blog, you had to have one, not just to create a profile in some platform, but to maintain a fully-featured website (like the one you are reading right now). From the author perspective an entry level for blogging in such environment was a much higher, but he/she had total freedom and more important ownership of his/her content. From the reader perspective entry point also was a little bit tricky: in order to build nice and convenient post feed with updates from all of your subscriptions you had to come up with something, nobody wanted to manually go over a list of sites on a regular basis. So people invented [RSS protocol](https://en.wikipedia.org/wiki/RSS).

RSS protocol is sort of standard contract between tools that blog authors use to distribute their content and apps that readers use to consume it. For example this blog also has RSS feed: you can navigate to [https://vorant94.io/](https://vorant94.io) and see human-friendly list of recent posts, but you also can navigate to [https://vorant94.io/rss.xml](https://vorant94.io/rss.xml) to get the same list of posts that can be easily passed to one of many RSS aggregators. Combine and render together dozens of such robot-friendly blogs in a single timeline and you'll get RSS feed. App that you would use to read such a feed is a RSS reader. [FreshRSS](https://freshrss.org/index.html) is exactly all of the above, it is RSS aggregator, reader and feed combined in one.

> **Side note**: any podcast you are listening from time to time is just an RSS-feed wrapped by a pretty app with an interface adapted for consuming audio content. So RSS is not just about text content

## One feed to rule them all ©

With all that being said FreshRSS was one of the first apps that I self-hosted and it went through a lot of iterations on how exactly I'm using it. For a couple of times I tried to centralise there all of the content I consume online since this way I could avoid annoying algorithmic recommendation feeds. But not all of the content platforms provide built-in RSS feed. YouTube does, Medium does, but Telegram, Twitter and Facebook don't. So I googled for a solution and found [RSSHub](https://docs.rsshub.app/), which basically a self-hosted web scrapper that can generate RSS feed pretty much from everything. So in case a platform supports RSS I could just add it to FreshRSS as is, and it case the platform doesn't support it, I could add via RSSHub.

This setup gave me one unified feed with all of my subscriptions: small personal website blogs, Medium profiles, YouTube channels, different independent podcasts, Twitter accounts and Telegram channels. I didn't succeeded on generating the feed from Facebook stuff, since its security policies required additional configuration for RSSHub, which I didn't want to dive into. Getting the feed from Facebook user accounts (compared to feed from FB public pages) is impossible at all from what I understood, so I just skipped it.

## And... it didn't work

A couple of months later I regretted the decision to go full RSS. As with any abstraction when you try to use a lot of different stuff in unified form you inevitable cut some corners, e.g. loose some unique features in each of these different things.

For example the way that Telegram channel feed was built was not perfect: sometimes I couldn't watch a video within a feed, sometimes something else I don't really remember now. But most crucial thing was is that there is no way to read or write comments without leaving the feed - duh! The same goes for Twitter, since almost always after I read a tweet I wanna jump to the comments and with RSS itself it is not possible.

Regarding podcasts: as I said they are RSS feed to begin with, but here I also had troubles. I'm sure nobody listens to podcasts on the platform they are actually published to, somebody uses Spotify, somebody - Apple Podcasts or whatever. But internally podcast feeds do generate links for their specific platforms. So instead of opening a podcast app installed on my phone, I got browser opened with some SoundCloud or yet another site, that I don't event have account for.

Furthermore talking about video content like YouTube: you probably notice that when someone sends you link to a video there and you try to open it from phone, it first opens browser and only then redirects to the app. These kinda links that are in the end resolved by apps are called [deep links](https://en.wikipedia.org/wiki/Mobile_deep_linking). Those redirects were very unstable and I ofter was left in the mobile YouTube site. Not mentioning that usage of YouTube via those tools cut me of from integrations with YouTube on Android TV. At some point I even found that Medium app, a text-based platform, is laggy when it comes to deep links...

So after all as of now I use RSS feeds only for Medium (mostly from my laptop, so I don't care about broken deep links) and small personal blogs, forums, that have no other way to distribute their content outside of their UI besides RSS.

## Reeder 5

FreshRSS by itself provides web interface to read / manage your feed. They even support UI theme customization, but I wanted more native experience. So I found [Reeder 5](https://reederapp.com/), exceptionally well designed RSS feed reader specifically for iOS/MacOS. It supports wide range of RSS aggregators to read feeds from there, which also included self-hosted FreshRSS instance. I cannot recommend it more, it is really beautiful app...

> **Side note**: recently I read a good [article](https://borism.medium.com/the-death-of-three-apps-72f3c0e802ab) about a couple of third-party clients for Twitter, Wikipedia and Reddit. All of them are now dead because of changes in the terms of usage of their respective services. And it is really sad because they showed what the UI can be if it is done separately from the main service. Twitter, Wikipedia or Reddit don't make money directly from their official apps, so their UI is about good enough quality. But paid third-party apps must give something above and beyond compared to official free apps, so they are forced to come up with a better solution. It shows how sometimes segregation of some system components (like service itself and app for it) can lead to overall better outcome for an end user

## Bonus

In case you don't have a desire to try self-hosting, but wanna play with RSS, there are plenty of apps / services that provide RSS aggregation, but do not require any sort of backend for it. For example Reeder I was talking about actually can work with RSS feeds stored in your iCloud. For Android a long long time ago I used [Feedly](https://feedly.com/), but I remember that I didn't like it much for some reason. In short there are more than enough options for you to try if you wish.
