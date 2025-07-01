---
date: "2012-05-13T13:29:36Z"
slug: journal-0-3-released
title: Journal 0.3 Released
---

After some recent emails from new users of Journal, I've released version 0.3.
(Journal is a [CLI tool][1] to help with keeping a work/personal journal).

If you have Journal installed with pip, you can

    $ pip install -U journal

### What's New

This version has been a long time coming, pulling in some patches from my friend
Drew and changing how arguments passing to Journal are handled. Here is the
official list:

- added support for multiple journals and journal locations
- added ~/.journalrc for storing default configurations of journals/locations
- changed argument handling to add all arguments to the same entry instead of
  splitting them up

### In Detail

Multiple journals have been in the master branch for awhile, but never
officially released. Likewise for multiple Journal locations. With the
.journalrc now and the multiple locations, you can keep your journal files in
Dropbox now and easily sync them across multiple computers. In the future, I am
looking to use the Dropbox API to have this happen automatically maybe, or
perhaps allow syncing with some sort of iPhone app.

The change to the argument handling was to done to make things easier for new
users. I think this was one UX decision that I made wrong when releasing Journal
originally:

#### v0.2.0

```
$ journal "one entry" "two entry"
```

#### v0.3.0

```
$ journal one large entry "and still part of first entry"
$ journal two entry
```

Allowing multiple entries at a time from one run of the program is cool and
limits issues with single/double quotes, but a confusing because people aren't
used to having to quote things by default. Overall, I think this is more Unix-y
and simler to understand.

### In The Future

Two things I'm looking at improving on are tests and long messages:

- I want to use a "fake FS" to limit be able to to unit test the features of
  Journal ([something like this][2])
- Entering long messages from the command line using $EDITOR; `journal edit` or
  something, which opens your editor in with a temporary file and when you
  save/close that file, that entire file gets saved. Perhaps integrating with
  the clipboard as well, for autosaving snippets of things. Journal all the
  things!

[1]: https://github.com/askedrelic/journal
[2]: http://www.willmcgugan.com/blog/tech/2011/3/20/creating-a-virtual-filesystem-with-python-and-why-you-need-one/
