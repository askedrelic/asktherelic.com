---
categories: Life
date: 2012/01/02 08:58:59
tags: ''
title: Backup Everything You Did Last Year
draft: false
---

A habit I've developed over the last few years is to backup all of my online
artifacts and identities once the year ends. Maybe I'm just a bit paranoid, but
in this day and age with more and more things being stored in the cloud, control
and access to your data is being shifted to faceless servers and scripts that
can disconnect you quite easily with little recourse. Whether it's a TOS
violation, a change in a company's policy, or just [something else screwy][1],
it's not something to worry about daily, but it's better to be prepared.

It's not all gloom and doom: having a local backup of your data is great for
searching and viewing in ways that the original provider didn't think about.
I think it's cool to be able see how emails I get year over year. A benefit of
being in this day and age is that storage is cheap: storing everything you've
ever created and done online is entirely possible.

###What To Backup

I started out with emails and figuring out to organize things. I then moved onto
email contacts, chat logs, Delicious bookmarks, and social site data. As of
late, I've been working on receipts and finances, trying to move to toward
existing entirely paper free! Here are some ideas, feel free to add suggestions
in the comments.

- Email
- Contacts (from GMail, Facebook, or LinkedIn)
- Chatlogs (Adium)
- Bookmarks (Delicious, Pinboard)
- Social site data (Twitter, FB, LinkedIn, Google+, Reddit)
- Pictures (Flickr, Picasa)

###How To Backup

Having a simple way to backup your data and having easy access to your data from
a website is also another important social topic that has come up the last
couple years. Having open APIs and an easy way to export your data is something
you should look for and if a website doesn't have one, you should ask why not.
Facebook didn't even have an export ability until the middle of 2010. Here some
sites and tools that I've been using to help me:

- [Google Mail][2]: [http://www.gmail-backup.com/][3] is my recommended tool for
  backing up GMail. Unfortunately it's closed source but the site has been
  around for years and the software has seemed reputable enough. It has a simple
  GUI or CLI interface that allows you to select date ranges to backup; all
  email from 2010, and it works for me.
  
    Once you download the 0.107 version, you can backup all 2011 email with
    a command like this: (you might need an app password if you have 2-step auth
    enabled)
  
    `$ ./gmail-backup.sh backup email-2011 <EMAIL> <PASSWORD> 20110101 20111231`

- Gmail Contacts: While logged into GMail, you can go to the Contacts window and
  export your contacts in multiple formats.

- All your Google data: Google is quite good about being open, but has a wide
  range of services, which don't all have the same ease of exportability. While
  logged in, go to [https://plus.google.com/u/0/settings/exportdata][4] and you
  should be able to backup your G+, Picasa, and most other data Google has on
  you.

- [Adium][5] is an open source OSX chat client which keeps XML logs of all your
  conversations, which includes your FB and GChat accounts if you have them
  enabled. All logs should be kept at `~/Library/Application Support/Adium
  2.0/Users/Default/Logs`. Since it's hard to pull out specific date ranged
  logs, I just back the whole log folder each year.

- [Pinboard][6]: I switched from Delicious this year and have been quite happy
  with Pinboard for my online bookmarking needs. To export, go to
  [http://pinboard.in/export/][7]

For most social sites, there is a lot of money in owning your data and every
site has a different obtuse backup policy. My friend [Jeremy][8] has created
a one stop shop for easily and safely backing up your data from FB, Twitter,
LinkedIn, Gowalla, and Google+ which I would recommend:
[http://export.synack.me/][9]

Another interesting idea for controlling your online data is what [Greplin][10]
provides: simple instant search of all your online data. You can easily look
across all of your data, although I don't think exporting that data is something
they offer.

###Final Thoughts

Once you have all this data, don't skimp on your own physical backups. Storing
all of your financial and personal data unencrypted in one place is a hacker's
dream. This is something I am still exploring: I use OSX's built-in DMG
encryption, but that is not too portable. 

Also look into [Dropbox][11] for having access to your data across all your
machines or [Backblaze][12] for having a simple external backup of everything on
your laptop.


[1]: http://mashable.com/2009/09/25/bank-sues-google/
[2]: http://mail.google.com
[3]: http://www.gmail-backup.com/
[4]: https://plus.google.com/u/0/settings/exportdata
[5]: http://adium.im/
[6]: http://pinboard.in/
[7]: http://pinboard.in/export/
[8]: https://twitter.com/#!/synack
[9]: http://export.synack.me/
[10]: https://www.greplin.com/
[11]: https://www.dropbox.com/
[12]: http://www.backblaze.com/
