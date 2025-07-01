---
date: "2012-01-15T14:31:28Z"
slug: interesting-trends-in-vim
title: Interesting Trends in Vim
---

Something I've noticed lately with vim plugins are that miniscripts and smaller
vim tweaks, any sort of vim functionality, are being packaged and shared as
a proper vim plugins via git, not just big IDE style plugins. This may not be an
entirely new idea, but I think it's becoming more of the norm to use pathogen
and git submodules to share everything vim related, rather than copying and
pasting actual code, I think the idea of managing everything via git, github,
and git submodules is pretty neat.

- Thanks to [Pathogen][1], plugins can remain separate from your main
  configuration, which great decreases the friction of trying new plugins and
  keeping your existing plugins organized.
- Thanks to git, plugins have revision history and stable versions (tags).
- Thanks to github, plugins have easy and stable endpoints to install from, to
  get updates from, and to complain about for bugs. Additionally, forking makes
  it easy to fix bugs yourself or make any tweaks you want, while still keeping
  everything in git.
- Thanks to [git submodules][2], you can store your list of installed vim
  plugins, update them when necessary, and share them between multiple machines.
- With [vundle][3] or [vim-addon-manager][4], you can search and install new
  plugins, all from within vim.

### The Theory

My dotfiles and vimrc have been in source control for years. I've always kept
a selection of vim plugins in my dotfiles repo, specific versions of plugins
that I know work together. Pathogen was an easy switch and made it much easier
to try new plugins and figure out if a new plugin played well with my current
configuration.

With git submodules and keeping everything in git, I've come to realize, you get
all of that and more. Want to try a new plugin? Download it to your vim bundle
directory and give it a try. Git status will show you that it's an untracked
directory and you haven't added it your dotfiles yet. When you decide you like
it, you can add it as a submodule and checkout version X, which you know works
correctly with your system.

Want to try out the latest dev version? Is there even a newer version to try?
Pull latest in that plugin's git repo and see if there are updates. If you like
those updates, commit the latest version in the git submodules, otherwise reset
everything to the last known working state.

Want to fix something in the plugin? Like some new features, but want to keep
some of the old features? Fork the plugin, delete the official submodule from
your dotfiles, and checkout your fork as a submodule. Everything can remain in
git still.

### The Practice

One of the best examples I've seen recently was a [Stack Overflow question][5]
a few months back. Someone asked how to add highlighting to paired html tags.
The answer was a [simple plugin][6] that added that exact functionality. Not
source code or a link to a vim wiki, but a full plugin, that with the setup
I just described, is a one-step process to try out.

I feel plugins have traditionally been complex things in vim, but by having this
easy and module process available and understood, more cool plugins will be
made. Looks like it's time to [Learn Vimscript the Hard Way][7] and start
writing my own plugins now!

[1]: https://github.com/tpope/vim-pathogen
[2]: http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
[3]: https://github.com/gmarik/vundle
[4]: https://github.com/MarcWeber/vim-addon-manager
[5]: http://stackoverflow.com/questions/8168320/can-vim-highlight-matching-html-tags-like-notepad
[6]: https://github.com/gregsexton/MatchTag
[7]: http://learnvimscriptthehardway.stevelosh.com/
