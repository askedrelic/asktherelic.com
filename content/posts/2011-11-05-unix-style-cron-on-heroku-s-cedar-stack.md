---
date: "2011-11-05T15:40:02Z"
slug: unix-style-cron-on-heroku-s-cedar-stack
title: Unix Style Cron on Heroku's Cedar Stack
---

I've been playing with Heroku for a project and wanted to use the default `cron`
addon to run a Python script and only email if that script printed anything to
stdout; regular Unix style.

[This repo is my attempt that][1].

Overall, I definitely accomplished what I set out to do! I've been very
impressed with Heroku's Cedar stack and how flexible it is. It's awesome being
able to script the creation of an enviroment and instantly see if my script is
working or not.

With that repo, you can basically use Heroku as a free cron running system you
control. The whole stack is free and if you just have to run something once a
day, that's still free. If you don't have a VPS or a server running 24x7, you
can now push stuff onto Heroku and not have to worry about keeping it online, it
will just work.

[1]: https://github.com/askedrelic/heroku-cedar-cron
