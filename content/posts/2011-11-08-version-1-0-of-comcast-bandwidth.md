---
date: "2011-11-08T01:01:01Z"
slug: version-1-0-of-comcast-bandwidth
title: Version 1.0 of Comcast Bandwidth Usage
---

After receiving some patches on GitHub this weekend and renewing my interest in
this project, I've decided to tag a 1.0 version of my [Comcast Bandwidth
Usage][1] script! After being stable for atleast a year and combined with these
new feature, it's probably worth finally tagging a stable version.

What's new in 1.0?

- Android Notifications of your usage via [Notify My Android][2]
- The ability to easily run the script on Heroku instead of your own server
- Now using standard config.ini configuration for your Comcast username/password

What's already there; what is this script?

- A simple way to scrape your current bandwidth usage from Comcast's website
  with the ability to specific warn you if are coming close to the 250GB soft
  limit

Download 1.0 [now][3] (zip).

### Upgrading

If you have already been running script, it might be easiest to download the 1.0
and re-enter your Comcast login into the config.ini. The previous method of
editing the script itself was pretty bad and left a lot of room for errors with
source control.

### Android Notifications

With commits from [Adalan][4], you can now add your API key from [Notify My
Android][5] and will be able to get your usage notifications via a push
notification to your phone.

Attach the `-a` flag when running the script to enable these notifications.

### Running On Heroku

This is a unique feature of the script, but was an idea I wanted to try: not
everyone has a server running 24x7 or a place where they can easily run Python
scripts like this daily.

With Heroku's new Cedar stack, while oriented for running web applications, you
can run any Python script on a daily schedule for free. It took a bit of hacking
detailed [here][6], but wasn't impossible.

See the [HEROKU_USAGE.markdown][7] document and try running the script on
Heroku!

Until bandwidth limits disappear, enjoy the script!

[1]: https://github.com/askedrelic/comcast-bw/
[2]: http://nma.usk.bz/
[3]: https://github.com/askedrelic/comcast-bw/zipball/v1.0
[4]: https://github.com/Adalan
[5]: http://nma.usk.bz/
[6]: /2011/11/05/unix-style-cron-on-heroku-s-cedar-stack
[7]: https://github.com/askedrelic/comcast-bw/blob/master/HEROKU_USAGE.markdown
