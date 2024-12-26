# [Browser tour]: Safari

*This year I noticed that a long-established traditional set of browsers (Chrome, Firefox, Safari, Opera) started to be supplemented by a new generation of alternatives. Personally, for the last few years, I've been switching back and forth between Chrome and Safari (peeking at Firefox from a long distance), but the drums of Brave, Vivaldi, Edge, Arc, and SigmaOS are getting stronger and stronger. So to add some variety to the day-to-day routine I decided to try something new and share it with you.*

---

I'll start with a Safari, a built-in MacOS and not Google Chrome, which is de-facto go-to browser in the modern world. There is a reason for it: since I myself use almost the entire Apple ecosystem, I got used to the huge amount of features, that are possible at all thanks to deep and mutual integration between all its devices. E.g. my starting point as a user is this experience of unified system, that smoothly flows from a laptop to network, from network to the phone and so on by the direction.

> **Side note:** this is my expectations from any modern software product. It is not enough to just do it's own single function (or several of those), the product should skillfully integrate itself into each user ecosystem. At the same time I understand that the lack of such integration may be caused by the issue "from the other side" (a developer of a some app is glad to integrate with something, but this "something" doesn't provide such an option). So I don't set the goal of finding the guilty ones, I'd like only to articulate my vision. I haven't come up with what to do with it yet.

## TouchID

So what are the integrations I'm talking about? First thing that comes to mind - is TouchID, fingerprint scanner. It can be used in Safari for the whole number of occasions: either password auto-fill guarded with fingerprint, or to confirm a transaction via Apple Pay, or for passwordless authentication (on sites that support Login via Apple). Everything is so good here so the third-party developers of Safari extensions have access to TouchID. E.g. such third-party apps like 1Password or Bitwarden (both apps are well popular third-party password managers) have a real opportunity to integrate themselves in such a way, so their user will notice no difference between usage of their product or built-in solutions from Apple.

## Time Limit

The next integration, that honestly I don't use as much, but is still worth to mention is Time Limit. I can as a user monitor or/and limit the amount of time spent in the apps. Interesting that combined time from all of your device is counted, e.g. after a half an hour reading Telegram channels from the phone and another half an hour doing the same from a laptop sum up to an hour of screen time in total. It could end up here, if not for one "but". Time using the Safari itself isn't counted, instead a separate by website statistics are sent to Time Limit. So if I have a limit of one hour per day for YouTube, after I spent this hour watching videos from my phone, I won't be able to go YouTube **website** so easily, which IMHO just makes sense ©️.

## Third-party apps

Now coming back to the topic of third-party apps on MacOS. There is a whole layer of programs that are either originally developed exclusively for this OS or only make sense within its boundaries. I am talking right now about three programs that I personally use on a daily basis. These are Reeder 5 (RSS reader and aggregator + Read Later service), Alfred 5 (an advanced alternative to the built-in MacOS Spotlight), and Things 3 (a to-do tracker). All these apps integrate seamlessly with Safari: Reeder has an extension for adding new feeds directly from the browser, as well as for using it instead of Safari's Read Later service; Alfred scans Safari bookmarks and allows you to open them without unnecessary clicks; Things, when adding a new entry through a pop-up window, understands the context and, if it's opened from within the browser window, inserts the address and title of the opened tab into the entry.

## AirPlay/ChromeCast

But just as good as Apple is at integrating its products with each other, they are just as bad at integrating with products outside the Apple ecosystem. Let's say you have a smart TV and you want to watch a movie there from some site (irrelevant if you use one of the streaming services like Netflix, which always have their own applications for smart TV). Typing a search query on the TV remote is a pain, connecting a computer via a wire is also a pain. AirPlay comes to the rescue - a technology that allows you to stream music/video from one device to another. But there is one caveat: AirPlay is an Apple technology, which means that "from one device to another" actually stands for "from one **Apple** device to another **Apple** device and nothing else". Now the question is: have you seen smart TV from Apple? The answer is no. There is an Apple TV console that connects to a real TV and makes it both smart and Apple-like at the same time. But personally, I don’t understand why buy a console separately from the TV, when modern TVs are already bundled with Android TV and at the same time they have support for an alternative to AirPlay - ChromeCast (and this technology is much more universal than AirPlay to begin with). As a result, we get the following picture: even if there is a website that supports ChromeCast, if there is a TV that supports ChromeCast, if there is a **laptop** that supports ChromeCast (MacOS itself after all supports this technology), the user still cannot stream media from the web directly to TV, because of Safari...

## Hide My Email

Regarding Apple services, the problems do not end with attempts to integrate Apple devices with the outside world. iCloud+ subscription has recently included the ability to automatically generate virtual email addresses for registration on various sites. This works great as a proactive anti-spam tool. A typical scenario is this: a user, when registering on some random site, specifies the generated email, Apple takes care of delivering letters from this virtual mail to user real mail, and if this random site is hacked or it sells its user base to some kind of spam-mailing people, the user will have the opportunity to disable the virtual address and not clutter up the real mail with spam. There’s just one “but”... Judging by my Bitwarden, I already have 100+ different accounts on the Internet, which means my real address has already leaked to wherever it was possible to leak. That is, at this stage there is zero real benefit from this service, but there is very much harm. If I start using it and in the future change my mind about paying for iCloud+, what will happen to all my accounts that were registered with virtual email addresses?

One could say, “Okay, don’t need it - don’t use it, what’s the problem?” But this is Apple, which means **they** decide for the user what he/she needs and what he/she doesn’t. Before the introduction of this service, when registering on websites, Safari offered to auto-fill in the email field with the address to which my Apple ID was registered, and this was convenient even taking into account the fact that I generate passwords through Bitwarden. But after the introduction of this service, Safari offers to enter **only** a new virtual address and that’s it, there is no way to return it to how it was. This is called aggressive marketing and disabling the usual functionality in order to persuade the user to a solution that is beneficial to the company itself.

## Browser extensions

Further more. Since Safari is a browser in itself, and isn't based on Chrome (like many modern solutions), developers must separately write versions of their extensions for it, which means that not everyone will do this. I don't use as many extensions as some folks, so in my case it's not as painful. The only extension that I personally miss in Safari, but that Chrome has, is the Metamask crypto wallet. But since I still haven’t gotten into crypto properly, even this is not critical.

## Sites support

Continuing with the fact that Safari is not based on Chrome, it is worth mentioning that it affects not only extension developers, but also website developers. Due to the popularity of Chrome, all sites are first checked for functionality in it, but they may forget to check the site in Safari. It's hard to believe, but only a year ago, I actually encountered sites either glitching or simply not working outside of Chrome. And this was not the site of some Vasya Pupkin, it was the PlayStation Network online store...

## Recognition of URL-addresses

This is a relatively small thing, but it so happens that this little thing is often and very much an bothers me. The thing is that in any modern browser, the address bar, in addition to its usual role (redirecting the user to the address he/she entered), also functions as a search bar. That is, if the entered input could not be recognized as a URL, it sends the user to the search engine, and the entered input now serves as a search query. So, I have a Raspberry Pi at home with a couple of local apps and a configured local DNS so that I can reach the raspberry not only by its IP, but also by the nice and short `pi.lan` address. And if in Chrome, when I enter `pi.lan`, the browser understands that I meant the site address, then Safari sends me to google for what is the `pi.lan` that I just typed... Only if I write `pi. lan/` (with a slash in the end), then Safari recognizes everything correctly and redirects me to the Raspberry. I sincerely do not understand this feature, because Safari recognizes regular addresses like `fb.com` without a slash at the end, which leads to constant confusion when in 99% of cases the user writes as usual, but in 1% of cases he is obliged to add slash at the end...

## Developer tools

And the last thing I wanted to mention, although this is rather my personal thing, is the developer tools. The point is that, given my profession, a browser for me is both a program for surfing the web and a tool for making money. If Chrome is the industry standard for web surfing programs, then Chrome dev-tools is the industry standard for website development tools. Let's say I like Safari as a surfing program, but this does not mean that I want to work in it. Having two browsers on a laptop and using each of them for its own purpose is quite a solution, but I think we are missing the point. On the one hand, it is clear and obvious why Safari does not have Chrome dev-tools (again, due to the fact that Safari is not based on Chrome), on the other hand, as a user I am not interested in these technical details. I would be happy if my "surfing program" and "tool for making money" were well integrated but different programs. It would be cool to use Chrome dev-tools in Safari or Safari dev-tools in Chrome (God forbid, but still)

## Summary

#### Advantages:

- perfect integration with MacOS technologies
  - TouchID
  - AirPlay
- perfect integration with Apple services
  - Apple Pay
  - Time Limit
  - Hide My Email
- good integration with third-party services
  - Reeder 5 (as an extension)
  - Alfred 5
  - Things 3
  - 1Password (as an extension)
  - Bitwarden (as an extension)

#### Disadvantages:

- no integration with technologies outside Apple
  - ChromeCast
- too aggressive marketing of Apple services when the user doesn't want to use some of them
  - Hide My Email
- much poorer selection of browser extensions
  - MetaMask
- there is no way to selectively use the browser’s built-in capabilities or completely replace them with third-party solutions
  - Chrome dev-tools instead of Safari built-in ones
  - password manager not as an extension, but rather as "native" replacement for built-in Autofill
  - the same as above, but with read latter apps
- some of sites can work unstably in Safari
  - PlayStation Network
- strange behavior when recognizing the input string as a URL-address
