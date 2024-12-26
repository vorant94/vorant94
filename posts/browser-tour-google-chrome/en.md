# [Browser tour]: Google Chrome

*This year I noticed that a long-established traditional set of browsers (Chrome, Firefox, Safari, Opera) started to be supplemented by a new generation of alternatives. Personally, for the last few years, I've been switching back and forth between Chrome and Safari (peeking at Firefox from a long distance), but the drums of Brave, Vivaldi, Edge, Arc, and SigmaOS are getting stronger and stronger. So to add some variety to the day-to-day routine I decided to try something new and share it with you.*

---

Now let's dive into the most popular browser currently available, Google Chrome.

## AirPlay/ChromeCast

As I mentioned earlier Chrome supports ChromeCast and it is a huge W, but it might come as a surprise that it doesn't support AirPlay... I don't see a reason for it. I can get why Apple allows itself to ignore everything outside itself (their own ecosystem covers 99% of user needs), but it seems Chrome shouldn't allow it to itself, because it is only a browser, that always exist as part of another operation system (ChromeOS doesn't count).

## Chrome extensions and apps

One of the typical features of a modern large apps is the ability to install all kinds of extensions, and Chrome is no exception. The task of such a system of plugins is primarily to get rid of “the other side” the problem, that is, to enable third-party developers to extend the functionality of the browser and/or integrate it with their services. Since Chrome is the most popular browser, the developers of those extensions in most cases will develop them specifically for this browser.

Besides just extensions, Chrome allows you to “install” sites as applications and optionally run them in a separate window just like a regular desktop app. Personally, this functionality didn't work for me for several reasons. First in terms of process management, these website applications are still tied to Chrome (although they work in a separate window), that is, if you completely close Chrome itself, the applications will also get closed; If Chrome itself freezes, so will your applications. Secondly, such applications do not recognize deep links (deep link is when, instead of a website, a link directs to a specific screen inside the application. For example, a link to a meeting in Zoom opens not just the Zoom application, but the login dialog for a specific call). E.g. when you open a link to a certain video on YouTube through the YouTube **application**, it will just open the home page, but when you open the same link through the YouTube **website**, everything will work as expected, and you will watch your favorite cats.

However, Chrome applications can also be opened as a regular tab, without creating a separate window. In this case, deep links are not broken, and the entire “application” serves only as a bookmark shortcut. For example, if you use some application launcher like Alfred, then along with applications you can also search for bookmarks, which slightly integrates the external Internet into your personal laptop.

## Integration with Apple/Google services

Coming back to the topic of integrations with OS technologies, Chrome is not integrated with TouchID in any way. This affects the user experience not only of the browser itself, but also of its extensions. For example, the Bitwarden extension for Safari can be unlocked using a fingerprint without any additional requirements, but the same in the Chrome version of the extension can only be done if the Bitwarden desktop client is running in the background...

There is also no separation of time spent in the browser by sites through Time Limit: an hour on YouTube is an hour in the YouTube application, and the site does not count. You can limit the time waste in Chrome itself, but in my opinion it just doesn’t make sense. Nobody sits in the browser itself, everyone sits on certain sites, and the browser is just an intermediary.

You would expect that Chrome, in exchange for the lack of integration with the user's ecosystem (in my case, the Apple ecosystem), would provide smoother integration with Google services, but I wouldn't say so. Just as Safari stores bookmarks, history, and passwords through iCloud, Chrome stores it all through Google Account. I didn't notice any unique service that could be called a competitive advantage or an exclusive feature of Chrome.

## Third-party apps

Here everything is much more ambiguous. On the one hand, due to the popularity of Chrome, some developers of application specifically for MacOS integrate with both Safari and Chrome, but some don't do this. In my case, the case is: Alfred 5 and Things 3 features, which I talked about in the previous post, work exactly the same as with Safari, but Reeder 5 decided not to provide integration with Chrome.

## Sites support

Here everything is just as should be expected: since the browser is the most popular one, sites are first of all developed and tested for the correct functioning in it. Which leads to the fact that a Chrome user will be least likely to encounter bugs or something like that coming from the sites compared to users of other browsers.

## Developer tools

Since I use Chrome for work and for programming outside of work, in this case I don’t feel the problem of two apps that I wrote about in the previous part (one for surfing the network, the other for development). But it won't change the fact that it is still impossible to separate these two elements.

## Summary

In fact, the overall impression of Chrome can be boiled down to the concept of a "blank slate" with the addition of Google services - it seems like there is nothing to talk about. All of its once progressive functionality has become the basic set of features of any normal browser. Which is not far from the truth, because Chrome by definition is Chromium + Google. That’s why the size of such review is noticeably smaller than the same about Safari. I don’t want to fill the resulting empty space with technical details about operating speed, battery consumption and so on, because from personal experience I didn't feel a difference on these points when moving from one browser to another.

#### Advantages:

- good integration with technologies outside Apple
  - ChromeCast
- good integration with third-party services
  - Alfred 5
  - Things 3
  - 1Password (as an extension)
  - Bitwarden (as an extension)
- a huge choice of any kind of browser extension
- perfect dev-tools
- excellent site support
- bookmarks can be stored as standalone apps (if you open them as tabs)

#### Disadvantages:

- not all third-party MacOS app are integrated with Chrome
  - Reeder 5
- there is no integration with MacOS itself
  - TouchID (the integration is achievable with additional effort)
  - AirPlay
- no integration with Apple services
  - Apple Pay
  - Time Limit
- no unique competitive integration with Google services
- there is no way to selectively use the browser’s built-in capabilities or completely replace them with third-party solutions
  - password manager
  - read latter services
- installed Chrome apps don't support deep links (if apps are opened in their own window)
