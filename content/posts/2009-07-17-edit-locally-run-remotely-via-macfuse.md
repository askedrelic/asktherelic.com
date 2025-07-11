---
date: "2009-07-17T13:37:02Z"
slug: edit-locally-run-remotely-via-macfuse
title: Edit Locally, Run Remotely Via MacFUSE
---

One of the most ample things I've had this summer has been time: time to read,
time to code, and time to tinker (or waste) on improving how I code. While I am
occasionally guilt <a
title="http://www.codinghorror.com/blog/archives/001282.html"
href="http://www.codinghorror.com/blog/archives/001282.html" target="_blank">of being
too 'meta,'</a> spending too much much time worrying about how I do work rather
than doing work, I feel that having the idea to improve in your head is far
better than stagnating. Some improvements are easy to invest in and quick to see
returns of saved time, others are not. Improving how you work and trying new
things is an investment than I feel is worth making.

The most recent change I've done is to use MacFUSE to mount my ssh connections
to remote machines as network files systems, via <a
title="http://en.wikipedia.org/wiki/Sshfs"
href="http://en.wikipedia.org/wiki/Sshfs">SSHFS</a>. Any machine that you have
an ssh connection connection to, you can mount as a shared drive, allowing you
to browse it via the Finder, copy and paste like any normal folder, and most
important of all, edit files on that share using local programs. I've used SMB
or FTP before, but neither has worked as smooth as this or as easily. Using this
method also gives you the security of SSH.

This guide will show how to install MacFUSE, then install and setup the GUI or
CLI version of SSHFS, depending on your preferences. The GUI version is sweet
and simple, but takes up more RAM and is not as customizable as the CLI version.
This is aimed primarily for OSX 10.5 users (The GUI version is 10.5 only, CLI
should be 10.4 compatible). Linux users should have most of this functionality
already built-in and I have not seen much free support for any of this in
Windows.

<h3>Install MacFUSE</h3>

The latest stable version of <a title="http://code.google.com/p/macfuse/"
href="http://code.google.com/p/macfuse/">MacFUSE</a> is 2.0.3. Download and
install the package. It is the base package which enables other plugins to build
custom filesystems with.

Download: <a title="http://macfuse.googlecode.com/files/MacFUSE-2.0.3,2.dmg"
href="http://macfuse.googlecode.com/files/MacFUSE-2.0.3,2.dmg">http://macfuse.googlecode.com/files/MacFUSE-2.0.3,2.dmg</a>

<a
href="http://thebehrensventure.com/wp-content/uploads/2009/07/macfuse_pref.png"><img
class="aligncenter size-medium wp-image-518" title="macfuse_pref"
src="http://thebehrensventure.com/wp-content/uploads/2009/07/macfuse_pref-449x189.png"
alt="macfuse_pref" width="449" height="189" /></a>

MacFUSE will be installed as a Preference Pane in your System Preferences.

<h3>Install the GUI SSHFS</h3>

The GUI version of SSHFS is an app called <a
title="http://www.macfusionapp.org/"
href="http://www.macfusionapp.org/">MacFusion</a>. Download and install their
app.

Download: <a title="http://www.macfusionapp.org/files/mf2_latest.zip"
href="http://www.macfusionapp.org/files/mf2_latest.zip">http://www.macfusionapp.org/files/mf2_latest.zip</a>

You then get a GUI with options to create new SSH or SFTP shares. Fill in your
connection details and hit the "Mount" button. Your share should appear on the
desktop, mounted at /Volumes/XXXX where XXXX is the share's hostname, but both
the mount location and share name are customizable in the options.

<a
href="http://thebehrensventure.com/wp-content/uploads/2009/07/macfusion_1.png"><img
class="aligncenter size-medium wp-image-520" title="macfusion_1"
src="http://thebehrensventure.com/wp-content/uploads/2009/07/macfusion_1-450x165.png"
alt="macfusion_1" width="450" height="165" /></a>

You can set MacFusion to run on login and have a menu item for easy
mounting/unmounting of shares. Quite easy!

<h3>Install the CLI SSHFS</h3>

I first found out about the CLI version and prefer this version due to the
customization it provides. Not everyone needs a command line app though.

First, checkout the code from Google Code using Subversion, following the <a
title="http://code.google.com/p/macfuse/wiki/MACFUSE_FS_SSHFS"
href="http://code.google.com/p/macfuse/wiki/MACFUSE_FS_SSHFS">official install
instructions</a>. OSX 10.5 should have Subversion installed.

    $ cd ~/Desktop
    $ svn co http://macfuse.googlecode.com/svn/trunk/filesystems/sshfs/binary sshfs-binaries

The binaries for 10.5 and 10.4 are the latest version of SSHFS, 2.2.0. Now you
need to create a folder to mount to and then mount the shared drive!

    # Mounting the SSH file system
    $ mkdir /some/mount/point # or use one that already exists
    $ sshfs user@host:/some/directory /some/mount/point -oauto_cache,reconnect,volname="some vol name"
    #My usual mount command
    $ mkdir /Volumes/thebehrensventure.com
    $ sshfs-static-leopard askedrelic@thebehrensventure.com:/home/askedrelic \
            /Volumes/thebehrensventure.com -oauto_cache,reconnect,volname="thebehrensventure.com"

From here, you link the binary to your /usr/local/bin perhaps and create a
script to automount the drive on login. Generally I prefer doing things via the
Terminal, but that's just me.

<h3>Working with SSHFS</h3>

With an ssh drive mounted, you can go to that drive via the Finder and browse it
graphically. Generally, I store my source code remotely on my server, edit the
local copy using GVIM or TextMate and then run it remotely. I keep a remote ssh
connection to the server I am editing on open, so I can run mysql commands or
reboot the webserver I'm using. With port forwarding, you can effectively do all
of your work on a remote server, but still have the benefits of GUI applications
and their performance.

One thing to watch out for is applying commands for the remote server on the
local folders. SVN or GIT will generally work in the local folders because their
commands are directory specific. I have heard of issues when working with a
large amount of folders before, with slow response times, but that is why I
would recommend to apply all commands remotely over ssh. My main usage of SSHFS
is over a LAN connection with a server sitting 10 feet from me. Browsing
directories via the Finder in the Icon view over a slower connection, with
Finder previews turned on and other bandwidth intensive accessories, will
definitely dampen performance. Try browsing in List mode if you have slow
performance.

Hope this helps! My next guide will detail my VIM setup, which takes advantage
of these mounted ssh drives.
