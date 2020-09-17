# Adventure
#### version 1.2.0
Come join us on a great adventure! This is our pre-release evaluation version.

*Target Release Date: September 2020*

## What's New

### Faster Launch Time
Average launch time for a Bubble is down from over 20 minutes to under 10 minutes.

### Smooth onboarding
The number of steps from signup to enjoying your Bubble has been greatly reduced, and the flow from one step to the
next is easy, clear and simple.

### Native Apps
If you participated in our alpha program, thank you! Connecting devices to your Bubble was cumbersome and error-prone.
It took many steps and not many people could figure it out on their own.

With Adventure, we have developed native apps for Windows, Mac, Android, and iOS.

To connect your device to Bubble, just install the app and sign in. That's it!

### More Blocking
We've added more filters to block lots more bad stuff. We've added DNS-level blocking to complement
our existing connection and stream blocking.

### Expanded ShadowBan Support
We've added ShadowBan support for several social media sites: Facebook, Instagram, Twitter, LinkedIn, and Reddit.

### More of the Internet "Just Works"
With our alpha release, users experienced problems using certain native apps like the iOS App Store, banking apps,
and other "certificate pinned" applications.
With Adventure, we've added better support for cert-pinned applications and most of them will "just work".

Bubble would also break some sites that used odd compression schemes. Users would see a screen of gibberish
instead of the website they wanted to visit. This has been fixed, and all websites should now load correctly.

### Flex Routing
Some services notice that your IP address is in the cloud. For example, Vimeo.com requires Bubble users to
complete a CAPTCHA before using the site. Some others (like macys.com) may deny VPN users entirely.

With flex routing, your Bubble can route traffic for certain sites and apps through connected devices at your home (or elsewhere).
You'll still get all the blocking and filtering from your Bubble, and the service will no longer know that you're
routing their traffic through your Bubble before it reaches you.

### Reliability
Previous versions of Bubble had problems after running continuously for several weeks.
They'd get bogged down and be unable to recover.

With Adventure, we have invested a boatload of time and energy into making Bubble rock-solid.
Bubble now also includes self-correction mechanisms to keep things on track.

### Performance
We've done a lot of work optimizing connection handling and speeding up per-connection decisionmaking.
Connections are handled faster and throughput is much improved.

### Backup and Restore
Bubble now supports backup and restore. This means you can stop your Bubble in one location, and start it in another.

## Caveats and Things We're Still Working On
The Adventure release is still in development. Here's what we are still working on.
All of these issues will be resolved prior to the final Adventure release.

#### Native Apps
The native apps also have some rough edges that we are still polishing. 

#### Blocking Coverage
Although blocking coverage has been greatly expanded, it's not yet where we want it to be. You may still see some ads, and some trackers may still get through.

Part of the purpose of this release is to identify more opportunities for blocking.

#### Certificate Pinning
Our support for cert-pinned apps has been expanded but is not yet comprehensive.

Another purpose of this release is identifying apps to add to our cert-pinned whitelist, so they also "just work".

#### Web Design
Our web app is being actively revised.
We are in the midst of replacing the old bootstrap styling with a branded UI that matches the app experience.
Until then, please bear with us and the halfway-done aspects of our web app design.

#### Backup and Restore
This feature is very new. We're still improving the workflow and interface, and ironing out any remaining bugs.
