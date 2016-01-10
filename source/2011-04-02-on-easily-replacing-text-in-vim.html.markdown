---
categories: Life
date: 2011/04/02 15:43:41
tags: ''
title: On Easily Replacing Text In Vim
draft: false
---
Or more specifically: search and replace using the current visual selection.

Lately with my job, I've been spending more time refactoring old code than
writing new code. Refactoring and manipulating code (and text) is something
that I think Vim is great at, once you really understand the different modes
and motions that Vim has, see Stack Overflow [for a good
summary][vim-philosophy]. Vim's [Search and Replace][sr] mode is what I've
primarily been using and while refactoring, I found some Vim tricks I wanted to
share.

Let's look at normal search and replace usage:

Find each occurrence of 'foo', and replace it with 'bar'.

```viml
:%s/foo/bar/gc
```

When dealing with complex functions or tricky variable names, I didn't want to
type out my function name again into Vim's command line. I wanted a way to
visually select my search text and just type my replacement text. I found some
help on [Stack Overflow again][1], finding out about the `<C-R><C-W>` shortcut
to insert the current word under under cursor. The Vim Wikia [explained this
shortcut][2] a bit further and I had enough ideas to write something out:

```
vmap <Leader>r "sy:%s/<C-R>"s/
```

So, visual map leader key + r to the command: yank the current visual selection
to the s register, then go into command line mode, setup a string replace on
the current buffer and use <C-R> to load text from the s register. Then you can
finish the replace command!

My final version include a tip from the Wikia article to run the search string
through substitute() to replace newline characters, allowing for multi line/end
of line searching. I had to switch to using the @ register format instead of
the quote register format for vim to complain though.

```
vmap <Leader>r "sy:%s/<C-R>=substitute(@s,"\n",'\\n','g')<CR>/
```

To expand on this command, to find the number of occurrences of the
visually selected word, before you run a replace on it:

```
vmap <Leader>c "sy:%s/<C-R>=substitute(@s,"\n",'\\n','g')<CR>//n<CR>
```

Other cool search aliases I found in vim:

* `[I` shows all instances of the word under the cursor in the document
* `]I` shows all instances of the word under the cursor after your current location

One final tip, regex can be a dangerous tool kids, so always use the confirm flag when replacing!

[sr]: http://vim.wikia.com/wiki/Search_and_replace
[vim-philosophy]: http://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim
[1]: http://stackoverflow.com/questions/3619809/how-do-i-insert-the-current-visual-selection-phrase-into-the-command-line
[2]: http://vim.wikia.com/wiki/VimTip490
[3]: http://stackoverflow.com/questions/4480147/in-vim-a-script-plugin-how-do-i-visual-selection-string-then-replace-with-a-new
