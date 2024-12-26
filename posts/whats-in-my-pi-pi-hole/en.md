![Pi-hole logo](cover.webp)

# [What’s in my Pi?]: Pi-hole

*A couple of years ago I bought myself a Raspberry Pi and using it as a home server hosting there a bunch of different apps. The whole setup went through several iterations and is still evolving. I'd like to share with you what I have there and how it is helping me in my day-to-day life. There will be several posts in order to make it more readable, so keep in touch*

---

If you have ever searched anything on the Internet, you probably are pissed of by the amount of ads modern websites have. It literally can be just a simple cooking recipe page, where after each step there is reserved placeholder for a targeting ad.

![ad meme](assets/ad-meme.webp)

Free mobile apps and games also have this decease, after all they need somehow to monetize themselves. If you are getting some service but aren't paying for it with money, you most likely pay with your time or still with money but later. Marketing people do know their stuff well, so these ads are in motion and blinking all the time to attract your attention at any cost.

## Ad-blocker

But for every action there is a reaction, so a long time ago ad-blocking software emerged. The way this software works is that it intercepts all of the outgoing internet traffic, goes over it with a huge block-list of a known ad platforms and blocks every request in case it is directed to one of block-listed addresses. So usual request for example to get recipe steps passes, but the request to retrieve the ad info to show fails hence it is not shown.

This approach has a couple of drawbacks. It cannot block internal website adds like pre-rolls of YouTube, or ad-posts of Facebook, since those are directed to the same address as a regular requests. Also the place that is reserved for the ad is not filled with some other content, it just stays blank (which is still better than seeing the ads).

All of the ad-blocking programs should be running in the background all the time. And while on PC it is probably ok, but on laptops and phones we have batteries, that are drained more and more with each background process. Then you have to install it on each and every of your devices that you'd like to avoid ads: separate app for laptop, separate app for phone. Most likely those apps are written by different developers, so the quality of the software probably varies. And I'm not even mentioning that stores like Google Play or App Store really don't like those kinda apps, since they decrease their ad income, so they forbid them from time to time.

One of the most popular apps that is meant to be used with Raspberry Pi is a [Pi-hole](https://pi-hole.net/), network-wide ad blocker. After you bootstrap it and configure the router to use it as DNS server (see below) it blocks the ads across the whole home network. It still runs all the time, but it runs on one energy-efficient computer. Obviously the moment you go outside your home, Wi-Fi is lost and ads are back, so each solution has its own trade-offs. Once in a while I install some free games on my phone and I got used to Pi-hole so much, that each time I play these games outside home I'm shocked by the amount of ads they have... How people without ad-blocker can even play them? After almost each restart player has to watch 10-20 seconds of ads, find and click on smallest possible 'x' button to close it and only after all of this he/she is permitted to continue the session? It is mystery for me...

## Custom DNS

Another use for Pi-hole is that it can be used as a custom DNS. DNS stands for Domain Name System. Each and every device that is connected to the network of any size (including Internet) receives an IP address, that it can be accessed by (for example one of the YouTube addresses is `208.0.0.65`). But nobody actually using real IP addresses to access devices, we are using human-friendly labels like `https://youtube.com`. The system that maps a label to an actual address is called DNS and the company that offers service for registering new records in such a system is called domain register.

Now back to local home network. My apps are hosted on Raspberry-Pi, which is connected to Wi-Fi, so it can be accessed from my laptop or phone. But by default it is accessible only by its IP address (something like `192.168.xx.xx`), which is not perfect. A better solution would be to access app by its name (e.g. something like `https://pi.hole`). There is no need to spend money on a domain record across the whole Internet, since I don't want to host my Pi be accessible from the outside, so domain register won't help here. Each device can hold its own mapping, that is relevant only for its needs, so it is possible to update my laptop inner records, but then such list of records should be maintained on each and every device that is going to use Pi, which is a headache. Besides it I suppose managing local DNS records on phones isn't as trivial as doing so on computers. And here comes the Pi-hole. Since it intercepts all the traffic it can also resolve domain names by itself, so all of the devices can benefit from apps that are hosted in Pi without need to handle real IP addresses.

## Bonus

I must say that setting up and configuring Pi-hole was one of the hardest things to host since it involves not only deployment of app itself, but adjusting the router and toggling some stuff on devices. Also some of the apps I'll tell you in next posts require a secure connection between a client and a server even thought the connection is purely internal in the scope of home Wi-Fi. But in the end it pays for itself: it is one-time time investment, that afterwards passively benefits all of household.

The trade-off of having it enabled only at home is actually can be somewhat avoided. In my case my Asus RT-AX55 allows on only usage of custom DNS server, but also in couple of clicks to set up home VPN server. VPN or Virtual Private Network, basically means that while the device is physically connected to any network out there, it can be configured to behave like it is connected to other network. It is widely adopted technology in modern world mostly to avoid country specific network restrictions. For example to access the site that is blocked in your country A you connect to VPN that is located in other country B and you can access it like you are in country B (unless VPN provider itself doesn't block this site by the order of country governance). So if I want I can block any ads and access my self-hosted apps outside of home just by connecting to VPN.

## P.S.

There is a nice branded Pi-hole case for Raspberry Pi, but [the official store](https://thepihut.com/products/pi-hole-edition-raspberry-pi-4-flirc-case) doesn't deliver to Israel. In case you know where to get one, please ping me😅

![pi hole case](assets/pi-hole-case.webp)
