---
title: Hosting with Dokku
date: 2017/01/08 13:03 PST
tags:
---

Having a platform to share my thoughts and work has always been important to me,
even when I only have time to use it sparingly. [I still like
blogging.](http://waxy.org/2016/11/redesigning-waxy-2016-edition/) This blog
also has been a great learning opportunity and with its latest upgrade: it’s now
running 100% over HTTPS (thanks to [Let’s Encypt](https://letsencrypt.org/)) and
being being deployed by Dokku and Docker.

### Dokku?

[Dokku](https://github.com/dokku/dokku) is a free replacement for Heroku, that
you can run on your own server. Without using too many acronyms, it's an app
management tool built around Docker. I started [using
Heroku](/2011/11/05/unix-style-cron-on-heroku-s-cedar-stack/)
back in 2011, when they added support for Python. The simple command line
interface for app deployment and free CPU time was a great selling point.

But as costs lowered for servers and with a personal desire to control more of
my own tools, for privacy and security reasons, the option to run my own became
really interesting.

### Some History

There have been three major versions of my blog, with different goals at
different times (although using three different programming languages wasn't
been goal, just a coincidence):

* [WordPress](https://wordpress.com/), PHP, 2006 - 2010ish
* [Blogofile](http://www.blogofile.com/), Python, 2010 - 2013
* [Middleman](https://middlemanapp.com/), Ruby, 2013 - present

Middleman is still currently being used to [generate this blog as a static
website](/2013/08/05/a-newer-branch/), but now with Dokku, it can be deployed
and updated via git push, which it really easy and convenient!

### Dokku Details

Docker is new hotness that makes deploying code really easy, but it’s still
a very manual tool, which is where Dokku comes in.
[Dokku](http://dokku.viewdocs.io/dokku/) controls Docker and makes it easy to
deploy whole applications; connecting databases,  caching servers, or multiple
servers together easily. It has a a simple command line interface and support
for plugins.

So what this means to me:

* It’s easier to deploy a new server now. Dokku manages app configs, so I closer
  to having a [12 factor app](https://12factor.net/), where configuration is
  part of the environment (server) and not part of the app. This makes it easier
  to keep my source code open.
* I can use plugins to setup SSL or databases correctly. The [Let's
  Encrypt](https://github.com/dokku/dokku-letsencrypt) plugin is really easy to
  use and makes an already easy process foolproof. I'm a big fan of
  [ PostgreSQL ](https://github.com/dokku/dokku-postgres) but I still have some
  legacy LAMP apps I'm running that need
  [MySQL](https://github.com/dokku/dokku-mysql). These plugins make it so easy
  to boot a database and have it backed up automatically to S3. More things are
  automated, hopefully leaving more time to create new things.
* Best practices and examples are easily shared. The nginx config that is
  running this blog comes from [a github
  fork](https://github.com/dokku/buildpack-nginx), that has
  continued to be improved overtime.

So I recommend Dokku if you are interested in running webapps easily and
controlling your server. You can see this blog's [code on
github](https://github.com/askedrelic/asktherelic.com), if you want to learn
more.
