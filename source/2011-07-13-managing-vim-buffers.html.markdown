---
categories: Vim
date: 2011/07/13 20:21:52
tags: ''
title: Managing Vim Buffers
---

Buffers are Vim's underlying way of managing text and perhaps a little confusing
to work with at first. Most GUI text editors have a direct "one window to one
file" correlation. You can open multiple documents and until they are saved as
disk files, they just exist on screen. Most times when I'm using Vim, there is
only one window open, but I am working on multiple files and switching between
them quickly, which is where buffers come in.

In Vim, a buffer represents a chunk of text you are working on. A buffer can be
a file or it can be an unsaved chunk of text. When you do a `:split` on a single
window, you have two views of the same buffer, or you can open up another file
and have two buffers visible. If you open up a third file and buffer, your
previous buffer will become a hidden buffer, which is where I think most
confusion comes from. Every file you open becomes a new buffer. If you make
changes on a file and switch to a new buffer, you have changes on a hidden
buffer, which could become lost if you close Vim before you save that buffer.
It's very easy and useful to have multiple buffers and split windows open, but
keeping track of those buffers is important.

### Managing Your Buffers

`:buffers` or `:ls` is the main command to see all buffers. `:bn` or `:bp` is
buffer next/previous to switch between them. Every buffer has a number, so
`:buffer 1` will switch to buffer #1. But once you move to having a dozen
buffers open, it becomes harder to manage. There are [scripts][4] to help with
this. Several plugins offer an onscreen view of all open buffers,
[bufexplorer][1] and [minibufexplorer][2] and add shortcut keys to make
switching buffers easier, but I have never found that on screen display
necessary.

<span class="aligncenter">
![minibufexplorer](/pic/minibuf.png)
</span>

### My Old: FuzzyFinder

I've grown used to switching buffers by partial name search or most recently
used (MRU) order. Simplifying that has process has been my goal in searching for
a buffer plugin. [FuzzyFinder][3] solved both of those problems well.

<span class="aligncenter">
![FuzzyFinder Buffer mode](/pic/ffbuffer.png)
</span>

FuzzyFinder is a big plugin, offering fuzzy text searching capabilities for
pretty much everything you can search for in Vim, but its buffer mode is quite
useful. It's a drop down list, with last accessed time displayed and sorted by
MRU. You can use `CTRL+N` or `CTRL+P` and a cursor to select the top few items
easily. You can type any partial buffer name to filter the list. I've used FF
for many years, but have found it slow at times and a bit quirky when
closing/deleting the windows it creates. Therefore, I've moved onto Lusty. 

### My New: LustyJuggler

My current choice is the [LustyExplorer][6] plugin and its compliment,
[LustyJuggler][7]. LustyExplorer offers a few other file opening capabilities
which I will explore in another post, but its buffer mode is top notch. Display
of all open buffers, order by MRU, with fuzzy text filtering capabilities and
Tab to select. Simple and quick.

<span class="aligncenter">
![LustyBuffer](/pic/lustybuffer.png)
</span>

Vim is all about saving key strokes, so why even type out a partial filename?
LustyJuggler allows you to "juggle" between open buffers, showing the last
9 used buffers with simple select using the 1-9 number keys or the `asdfghjkl`
row of keys, for qwerty keyboard users.

<span class="aligncenter">
![LustyJuggler](/pic/lustyjuggler.png)
</span>

Finally, one of the new features I'm still learning to use is BufferGrep: very
quick grep of all open buffers.

<span class="aligncenter">
![LustyBufferGrep](/pic/lustygrep.png)
</span>

I plan to cover LustyExplorer more in the future, but for now, it has been
a quite useful and clean plugin. Once you have begun to get a better grasp over
your buffers, you can move to tabs and vertical split windows and having access
to your source code in many different ways. Feel free to share how you use
buffers in the comments.

[1]: http://www.vim.org/scripts/script.php?script_id=42 "bufexplorer"
[2]: http://www.vim.org/scripts/script.php?script_id=159 "minibufexplorer"
[3]: http://www.vim.org/scripts/script.php?script_id=1984 "FuzzyFinder"
[4]: http://vim.wikia.com/wiki/Easier_buffer_switching
[5]: http://vim.wikia.com/wiki/Vim_buffer_FAQ
[6]: http://www.vim.org/scripts/script.php?script_id=1890 "LustyExplorer"
[7]: http://www.vim.org/scripts/script.php?script_id=2050 "LustyJuggler"
