---
categories: Life
date: 2010/04/05 14:11:58
tags: ''
title: Fixing MacFusion with OSX 10.6.3
---

MacFusion is a great little app that allows you to mount network locations over
SSH, which I've [mentioned before][1]. With the latest 10.6.3 update in OSX, the
latest version MacFusion 2.0.3 breaks. Unfortunately, the developers of
MacFusion haven't touched the app in over 2 years.

I found a fix on the [MacFusion Google Group][2]. A third-party developer, nall,
fixed the problem and updated the binary to 2.0.4, available at
<http://github.com/downloads/nall/MacFusion2/Macfusion-2.0.4-SL.zip>. This
version works fine for me on 10.6.3. While this might not be a long term fix, it
works now and I will update this post if an official way comes out.

This latest version also now correctly shows the volume size for the mount
point, which previously would only show "1TB" for me. Hooray for working
software!

[1]: http://asktherelic.com/2009/07/17/edit-locally-run-remotely-via-macfuse/
[2]: http://groups.google.com/group/macfuse/browse_thread/thread/3c611784177843f0 "MacFusion google groups"
