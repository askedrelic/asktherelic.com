---
title: Upgrading My Dotfiles To Symlinks
date: 2014-04-21 21:12 PST
---

Tinkering with my configuration and dotfiles is a never ending hobby. After
finding Github's guide to [dotfile configurations][1], I evaluated several of
the repos and decided to upgrade [my own dotfiles][2].

For the longest time, my home directory (`/home/askedrelic` on most systems) has
been a git repo. This has mostly worked but has several problems:

* everything writes to your home directory; you wind up with many of untracked
  files, unless you ignore them, which is then a pain to keep updating your
  `.gitignore`
* easy to add files; mistype a filename or tab-complete and your whole `.ssh`
  folder could get added with your private keys
* impossible to keep any sensitive files (atlhough this is mostly a side effect
  of keeping my dotfiles public on Github)
* hard to initialize on new machines; git likes to clone to an empty directory
  and your home directory is never empty, even on new machines

Despite these complaints, this method has worked out me for several years. It
has allowed me to use default git functionality (git-submodules) for my vim
plugins and easily keep them up to date. I can git-pull and have the latest
configurations by re-opening my shell.

I wanted a way to upgrade my existing repo with minimal changes and keep my
git-submodules. Several of the Github recommended dotfile repos were not
interesting to me for their forced use of ZSH or complex Ruby/Rake scripts to
handle updating. I have a bit of sunk cost with Bash and wanted the option to
gradually upgrade to ZSH.

Therefore [Zach Holman's dotfiles][3] looked best to me:

* easy upgrade/install using a Bash bootstrap script with no magic
* support for symlinked files or directories to allow my git-submodule use to
  continue
* no forced ZSH configuration
* great topic based organization of files

It took a few tries to figure out copying his `script/bootstrap` was mainly what
I wanted. Moving my existing git-submodules to a new location was obtusely hard,
until I found a script to handle it:
[https://github.com/iam-TJ/git-submodule-move][4].

The upgrade was basically:

1. `git clone https://github.com/askedrelic/dotfiles/ .dotfiles`
2. `cd .dotfiles && script/bootstrap`
3. Follow the prompts and overwrite or backup any files I am trying to symlink

This new layout allows for much better organization going forward. Check it out
here and see your dotfiles could use an upgrade:
[https://github.com/askedrelic/dotfiles/][5]


[1]: http://dotfiles.github.io/
[2]: https://github.com/askedrelic/dotfiles/
[3]: https://github.com/holman/dotfiles
[4]: https://github.com/iam-TJ/git-submodule-move
[5]: https://github.com/askedrelic/dotfiles/
