---
date: "2006-04-19T12:00:00Z"
slug: i-hate-apache
title: I Hate Apache
---

Okay, not really, Apache does a great job for a webserver, very stable, very
easy to use, and it works most of the time. However, I'm becoming incredibly fed
up with it as I try to do more complex things.

URL redirection and bandwidth limiting are not possible under my current
configuration. URL redirection semi-works, although not under my main www
directory, only under sub folders, why, I don't know! I cannot get my htaccess
file to have any access under the main www directory which annoys me to no end.
Bandwidth limiting is possible, but only through modules that you have to
compile and make yourself. I'm decent at Linux, but not that good yet, so it's
impossible for me.

More or less what I think will happen is that I am going to install LightTPD, a
lightweight web server with FastCGI, which will help my PHP code, and includes
build in URL redirections. Either way, I'm just getting fed up with Apache.
