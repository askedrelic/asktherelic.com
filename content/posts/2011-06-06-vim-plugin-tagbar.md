---
date: "2011-06-06T22:26:06Z"
slug: vim-plugin-tagbar
title: "Vim Plugin: Tagbar"
---

Continuing with [upgrading and explaining my Vim setup][1], I'm going to cover
Tagbar and TagList today. Both are plugins that provide high-level views of your
source code at a class and function level, similar to Eclipse, Visual Studio, or
other IDEs. The view is available in a quick toggle sidebar, which you can sort
and use to jump around in your source file. Both plugins make use of [Ctags][2],
which parses the source code for most popular languages.

Having a high level view is great for understanding new code, getting a quick
layout of a file, and simplifying your interaction with a source file; working
with classes and functions, not line numbers and searching.

### The Old: TagList

[TagList][3] has been around 2002 apparently, but I've only been using it for a
few years. TagList was great, but flawed in its feature. It has only ever
offered a separate Class, Function, and Variable list on your source file.

![TagList][4]

It was great to place to start, but not optimal. TagList was also last updated
in 2007.

### The New: Tagbar

[Tagbar][5] is still a new plugin as of 2011, but offers a major improvement
over TagList by displaying tags order by scope; Class first, then all its
Members, then the next Class. It maintains the same keybindings as TagList: `p`
to jump around in your file, `Ctrl + N or Ctrl + P` to jump between definitions.
Also support for Constants and color!

![Tagbar][6]

Tagbar has been updated several times in the last few months and I haven't run
into any bugs. Tagbar is definitely worth [upgrading to today][7]!

Keep [following me][8] for more new Vim plugins.

[1]: /2011/05/30/the-state-of-my-vim-configuration/
[2]: http://ctags.sourceforge.net/
[3]: http://vim-taglist.sourceforge.net/
[4]: /pic/tag-1.png
[5]: http://majutsushi.github.com/tagbar/
[6]: /pic/tag-2.png
[7]: http://majutsushi.github.com/tagbar/
[8]: /code/feed
