---
date: "2008-02-01T13:57:14Z"
slug: shared-hosting-sucks
title: Shared Hosting Sucks
---

I'm a bit wired on coffee right now, but this is a rant that has been building
for awhile. Shared hosting sucks. After years of experience with many different
providers and situations, I'm fed up with it. The idea is great, a shared
utilization of resources because usually one person on a server is not going to
use 100% of the resources, but how the situation is with most providers is
terrible. Recently, I've been coming around more and more to the idea of a
[VPS][1], a shared server setup, but not sharing just one system.

To rant specifically, I'm tired of dealing with other people. Most shared hosts
have CPanel or some other web-based GUI management system that is usually not
efficient enough for me. I am definitely an advanced or expert user. I need SSH
and direct access on a server. When CPanel can't solve things for me, I have to
ask for someone else's help to fix things, which can take hours or might not
even resolve the situation. Relying on other people un-efficient, especially
when I have no clue about how competent these people are. I prefer to learn and
solve things myself. With the big interest in VMWare recently and VPS software
in general, more companies are offering VPS solutions at reasonable cost. The
general limiting factor is RAM, due to the physical capacity of most 32-bit
servers at 4GB, so you might only get a VPS with 128mb RAM. I find this actually
more than reasonable for most website solutions running Apache and MySQL. If you
need better performance, run a low memory webserver like nginx or lighttpd. It's
just so much easier to fix something that is broken yourself. From now on, VPS
will be my first choice for running a webserver and I hope you do the same.

[1]: http://en.wikipedia.org/wiki/Virtual_private_server
