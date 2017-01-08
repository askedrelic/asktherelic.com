---
title: Hosting with Dokku
date: 2017-01-08 13:03 PST
---

Having a platform to share my thoughts and work has always been important to me,
even when I only have time to use it sparingly. [I still like blogging.][1] This
blog also has been a great learning opportunity and with its latest upgrade:
it’s now running 100% over HTTPS (thanks to [Let’s Encypt][2] and being being
deployed by Dokku and Docker.

### Dokku?

[Dokku][3] is a free replacement for Heroku, that you can run on your own
server. Without using too many acronyms, it's an app management tool built
around Docker. I started [using Heroku][4] back in 2011, when they added support
for Python. The simple command line interface for app deployment and free CPU
time was a great selling point.

But as costs lowered for servers and with a personal desire to control more of
my own tools, for privacy and security reasons, the option to run my own became
really interesting.

### Some History

There have been three major versions of my blog, with different goals at
different times (although using three different programming languages wasn't
been goal, just a coincidence):

* [WordPress][5], PHP, 2006 - 2010ish
* [Blogofile][6], Python, 2010 - 2013
* [Middleman][7], Ruby, 2013 - present

Middleman is still currently being used to [generate this blog as a static
website][8], but now with Dokku, it can be deployed and updated via git push,
which it really easy and convenient!

### Dokku Details

Docker is new hotness that makes deploying code really easy, but it’s still
a very manual tool, which is where Dokku comes in.
[Dokku][9] controls Docker and makes it easy to
deploy whole applications; connecting databases,  caching servers, or multiple
servers together easily. It has a a simple command line interface and support
for plugins.

So what this means to me:

* It’s easier to deploy a new server now. Dokku manages app configs, so I closer
  to having a [12 factor app][10], where configuration is part of the
  environment (server) and not part of the app. This makes it easier to keep my
  source code open.
* I can use plugins to setup SSL or databases correctly. The
  [Let's Encrypt][11] plugin is really easy to use and makes an already easy
  process foolproof. I'm a big fan of [PostgreSQL][12] but I still have some
  legacy LAMP apps I'm running that need [MySQL][13]. These plugins make it so
  easy to boot a database and have it backed up automatically to S3. More things
  are automated, hopefully leaving more time to create new things.
* Best practices and examples are easily shared. The nginx config that is
  running this blog comes from [a github fork][14], that has continued to be
  improved overtime.

So I recommend Dokku if you are interested in running webapps easily and
controlling your server. You can see this blog's [code on github][15], if you
want to learn more.


[1]: http://waxy.org/2016/11/redesigning-waxy-2016-edition/
[2]: https://letsencrypt.org/)
[3]: https://github.com/dokku/dokku
[4]: /2011/11/05/unix-style-cron-on-heroku-s-cedar-stack/
[5]: https://wordpress.com/
[6]: http://www.blogofile.com/
[7]: https://middlemanapp.com/
[8]: /2013/08/05/a-newer-branch/
[9]: http://dokku.viewdocs.io/dokku/
[10]: https://12factor.net/
[11]: https://github.com/dokku/dokku-letsencrypt
[12]: https://github.com/dokku/dokku-postgres
[13]: https://github.com/dokku/dokku-mysql
[14]: https://github.com/dokku/buildpack-nginx
[15]: https://github.com/askedrelic/asktherelic.com
