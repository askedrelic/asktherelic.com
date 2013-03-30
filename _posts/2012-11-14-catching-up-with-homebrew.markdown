---
categories: Life
date: 2012/11/14 00:44:36
tags: ''
title: Catching Up With Homebrew
draft: false
---

Homebrew is pretty sweet. I've been very pleased with easily keeping my OSX
system up to date since it was released; no more Fink/MacPorts, it's
automatable, it just works (well, as long as you keep installing the latest
XCode or OSX Command Line Tools).

*You are using Homebrew to install and update all your programs, right? If not,
checkout the [homepage][1] now.*

However, when just following the [Homebrew repo][2] on GitHub, I think keeping
up to date with what is "new" with Homebrew has always been hard. Maybe
I haven't paid enough attention or read enough of the man pages.

So here is an overview of a bunch of new features I found out about recently,
including the ability to install GUI OSX applications, via [Cask][3]:

### Outdated

Despite what I just said about staying up to date, I upgrade specific packages
by choice. `brew update` will get you the latest install scripts, `brew oudated`
will show what versions have changed. For some programs; PostgreSQL, there is
associated data that has to be migrated and sometimes I don't want to upgrade.
I usually `brew upgrade <package>` or multiple packages at once, once I find
they are outdated.

### Versions

Along the same lines, want to install an old version of a package?

Want to find out which versions there are? `brew versions <package>` will show
the previous versions and allow you to checkout the install script for
a previous version.

### Install via URL/local file

Found a new install script for a cool package Github, want to test it out
quickly? Copy the raw package URL from Github and `brew install
https://github.com/mxcl/homebrew/raw/master/Library/Formula/ace.rb`

Or install via local absolute file paths, if you want to download the script and
then edit it.

(This was added with [Homebrew 0.8][4] about 18 months ago

### Taps

Longterm, you probably don't want to have a bunch of packages installed from
random urls or old versions of install scripts checked out in your Homebrew
repo. Also, for the Homebrew maintainers, I guess managing one huge repo of all
packages became more difficult as Homebrew grew more popular.

Taps allow you have to setup multiple package repos.

* [Versions][5] provides multiple versions of existing packages; python24,
  python25, python 26. Homebrew official python is only 2.7.3 
* [Dupes][6] has dupes of OSX system packages 
* [PHP][7] is a bunch of scripts for making latest PHP easier to install.
  Overall, I gave up PHP development on OSX and moved to Linux VMs, but maybe
  there is hope!

Setting up a private repo for your own scripts or company isn't that hard
either, if you wanted to vendor fork a bunch of packages and make use of
Homebrew.

Once you've added a Tap, `brew search` and `brew install` automatically check
that repo for packages. `brew update` will check all Taps for updates as well.

Want to see your installed Taps?  

    ls `brew --prefix`/Library/Taps

(This was added with [Homebrew 0.9][8] about 9 months ago

### Cask 

[Cask][9] is something I just found today, after trying to replicate it's
functionality in Homebrew. Homebrew is great for system packages, but why not
GUI apps and regular OSX programs? Installing downloaded zip/dmg files is what
Cask does.

Add the Cask repo `brew tap phinze/homebrew-cask` and install it to Homebrew
`brew install brew-cask`

Now install Google Chrome, Spotify, Sparrow, iTerm2 in one line `brew cask
install google-chrome spotify sparrow iterm2` and those apps are now installed
and usable.

I just started using this, I have no clue how Sparkle or apps that auto-update
themself work with this, but I still think it's a great idea. The integration
isn't great with Homebrew right now; you have to search Cask apps separately,
`brew cask search`, but hopefully that will improve in the future.

If you use Alfred and wonder why your newly installed apps aren't showing in
Alfred, read the Cask README [to the bottom][10]

### External Commands

Coincidentally, I didn't realize the Tap and Cask commands were mostly done via
Homebrew's external command support, ala git. See more [here][11].

To see the currently (probably default) set of available commands 

    ls `brew --repository`/Library/Contributions/cmds

### Services

This is one of the coolest commands I haven't been using: brew managed wrapper
around launchctl. `brew services` to find out more.

Next time you upgrade redis and get that unload/load message, unload redis, copy
the latest launch plist, and then: `brew  services redis start`. You can `brew
services list` to see all of your Homebrew services started under services, no
launchctl tinkering.

Happy brewing!


[1]: http://mxcl.github.com/homebrew/
[2]: https://github.com/mxcl/homebrew
[3]: https://github.com/phinze/homebrew-cask
[4]: https://github.com/mxcl/homebrew/wiki/Homebrew-0.8
[5]: https://github.com/Homebrew/homebrew-versions
[6]: https://github.com/Homebrew/homebrew-dupes
[7]: https://github.com/josegonzalez/homebrew-php
[8]: https://github.com/mxcl/homebrew/wiki/Homebrew-0.9
[9]: https://github.com/phinze/homebrew-cask
[10]: https://github.com/phinze/homebrew-cask#alfred-integration
[11]: https://github.com/mxcl/homebrew/wiki/External-Commands
