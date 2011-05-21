---
categories: Life
date: 2011/04/11 21:44:01
tags: ''
title: Air Speakers For Everyone
draft: false
---

Earlier today, the private key from Apple's Airport Express was [found and
released][1], along with some Perl code, finally allowing for anyone to create
their own "Air Speaker" without using the Airport Express. With this code, any
OSX or Linux computer can now be turned into an AirSpeaker, that any iPhone or
iPod Touch, or iTunes, can now stream music to seamlessly. This really is
fantastic because it allows a great deal of flexibility with how you play
music, which has been limited for years now.

I found the hack via [HackerNews][2] and combined with some code improvments
from GitHub, managed to get it working on both OSX 10.6 and Ubuntu 9.10. Here
are the steps I followed:

### OSX 10.6

Although the Perl code was originally designed for Linux, the Internet managed
to get things running on OSX quite quickly. I found this fork of the Linux code
to be easiest to install on OSX: [https://github.com/albertz/shairport][3] @
2aace590d2099fcf83d8b94b350bcc67d8d58788

Assuming you already have XCode and Homebrew installed, the only steps you should need are:

 * `brew install pkg-config libao`
 * `perl -MCPAN -e 'install Crypt::OpenSSL::RSA'`
 * `git clone https://github.com/albertz/shairport`
 * `cd shairport` 
 * `make`
 * `perl shairport.pl` should have you running!

### Ubuntu 9.10

For my Ubuntu Boxee system, there were more packages to install. I used the
original Linux code version, which the OSX version is forked from, at
[https://github.com/bbhoss/shairport][4] @ 6e1f784b41629e88ab441f500538d45ec807e2e2. You might not need all these steps if
you already have Perl installed.

 * `sudo apt-get install libcrypt-openssl-rsa-perl libao2 libao-dev` (Program dependencies)
 * `sudo apt-get install avahi-daemon avahi-discover avahi-utils libnss-mdns service-discovery-applet mdns-scan` (Avahi dependancies)
 * `sudo service avahi-daemon start` (you need Avahi running)
 * `perl -MCPAN -e 'install Crypt::OpenSSL::RSA'`
 * `perl -MCPAN -e 'install HTTP::Message'`
 * `perl -MCPAN -e 'install IO::Socket::INET6'`
 * `git clone https://github.com/bbhoss/shairport`
 * `cd shairport` 
 * `make`
 * `perl shairport.pl` should have you running!

Assuming everything is working, the Air Speaker is running, and both iPhone and
computer are on the same network, you should be able to select the Air Speaker
like below. For me atleast, this is great because I have all my podcasts on my
iPhone and really love the iPhone app Podcaster for listening and organizing my
podcasts. Now I don't have to sync anything on my computer, I can keep it all
on the iPhone and just play my podcasts to what ever computer I want
wirelessly!

<span class="aligncenter">
![AirSpeakers][pic1]
</span>

[1]: http://www.mafipulation.org/blagoblig/2011/04/08#shairport
[2]: http://news.ycombinator.com/item?id=2431318
[3]: https://github.com/albertz/shairport
[4]: https://github.com/bbhoss/shairport
[pic1]: /pic/airspeakers.png
