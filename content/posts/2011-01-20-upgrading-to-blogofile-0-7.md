---
date: '2011-01-20T22:51:10Z'
slug: upgrading-to-blogofile-0-7
title: Upgrading To Blogofile 0.7
---


I saw [recently on PyPI][1] that blogofile, the Python blog engine that
builds this blog, updated to version 0.7. This prompted me to upgrade my blog
from 0.6 and detail the changes here, since the blogofile docs don't seem to
have kept up. For the most part, this was discovered through trying to build my
blog until it worked. I used the the `blogofile init simple_blog` and
`blogofile init blogofile.com` projects as examples of "working" 0.7 projects
and pulled code from them when my 0.6 code wasn't working.

### Main Changes

* The blogofile main config has changed. This always seems to the change the
  most between versions, My recommendation is that it would be quicker to scrap
  your old config and just reconfigure everything. The main reason is that every
  config variable is now more OO, being attached to a blog object, cleaning up
  the mess of random variables previously:

    ```
    -blog_auto_permalink_enabled = True
    +blog.auto_permalink.enabled = True
    ```

* With the new config naming scheme, your templates must be updated.  I did this
  manually since I had tweaked my templates and wanted to keep my changes. You
  must update all config references to use the blog object; the disqus config
  variable mostly:

    ```
    -% if bf.config.disqus_enabled:
    +% if bf.config.blog.disqus.enabled:
    ```

* Controllers have become more generic and the "blog" controller has moved to
  it's own subfolder/module. From what I understand with the development of
  blogofile, this has been done to point blogofile toward becoming more of
  a static file generating engine with a blog controller, not just a blog
  engine. This is a good thing, but requires rebuild most of your controllers
  directory. I would pull these from the `simple_blog` project.

* Likewise, filters for markdown and syntax highlighting have been updated,
  I would pull these from the `simple_blog` project.

[See here][2] for the diff of my main 0.6>0.7 commit.

### New Stuff

With that out of the way, the cool things that 0.7 brings are:

* Support for drafts! Just add a `draft: true` to your blog header and you can
  keep your post in source control, but not have it published!

* Built-in linenums on source code now! Just add the `linenums=true` variable in
  your code tag.

    ```
    $$code(lang=python,linenums=true)
    foo = 1
    bar = 3
    $$/code
    ```

* Version increment! This version has been a long time coming, but I feel I am
  missing most of the "behind-the-scenes" code changes that have made blogofile
  more dynamic and are paving the way for more powerful stuff in the future.

Keep writing more code to make that future happen! To view the the source for
this post and the rest of my blog, see [my github project][3].

[1]: http://pypi.python.org/pypi/Blogofile
[2]: https://github.com/askedrelic/asktherelic.com/commit/db490969f3a3913da20ecc7c189e975c28ed975d
[3]: https://github.com/askedrelic/asktherelic.com
