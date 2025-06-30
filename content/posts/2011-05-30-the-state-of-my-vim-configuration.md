---
date: '2011-05-30T00:14:38Z'
slug: the-state-of-my-vim-configuration
title: The State Of My Vim Configuration
---


I've grown to become a huge Vim fan over my years of programming, probably
beyond what most people would call normal. I think my interest in Vim stems
from my interest in the tools that I use to code; I appreciate the manner in
which I write code almost as much as the code I write. In the craftsman
philosophy, I'm a big fan of functional tools that serve their purpose well,
[CoolTools][1] for example. In the hacker philosophy, I'm a big fan of
constantly improving and hacking everything to achieve that, [my terminal][2]
and [Vim][3] for example. Vim is a great tool that continues to show me new
tricks every day but I think that with my understanding of Vim, it's time to
give back and advocate for Vim's awesomeness.

### Vimrc

The `.vimrc` is where most tweaking begins. Mine is currently up 675 lines,
half comments, half code. Latest version is always [available on Github][4].

Vim has a deep learning curve, with nearly everything being customizable. After
severals years of tweaking, my .vimrc has turned into a mix of aliases and
settings, letting me code the way I want. Here are some basic key remappings
for some alternate ideas:

```viml
" Professor VIM says '87% of users prefer jj over esc', jj abrams strongly disagrees
imap jj <Esc>

" Save even more keystrokes!
nnoremap ; :

" Move around split windows with ctrl key!
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" have Q reformat the current paragraph (or selected text if there is any):
nnoremap Q gqap
vnoremap Q gq

" Go to the middle of the line
nmap gm :exe 'normal '.(virtcol('$')/2).'\\|'<CR>

"Easy edit of vimrc
nmap <Leader>ev :e $MYVIMRC<CR>
nmap <Leader>sv :source $MYVIMRC<CR>

"Clear all spaces at the end of the line
nmap <Leader>s :%s/\\s\\+$\/\/<CR>
```

### Current Plugins

Plugins are the other powerful component of Vim. Vim is a very powerful text
editor, but through its many plugins, it can be extended to be a 'build your
own IDE'. This might seem a little over the top, but I've found it has been a
great learning experience, to help better understand my code and what
information I want out of it.

[Pathogen][5] has been the most recent plugin that has definitely made it far
easier to install and try out new plugins: instead of install a Vimball and
tracking what files you installed in your `~/.vim` directory, it creates a
`~/.vim/bundle/` directory where you can install plugins into separate folders and
it keeps everything much more tidy. After you have Pathogen installed, all
other plugins are just new folders (or git clones).

* [`fuzzyfinder_textmate`][6] is a fork of the `fuzzyfinder` plugin for Vim,
  which allows for "fuzzy" searching of all files in your current directory;
  case and place insensitive filename search. Also for fuzzy opening of buffers.
  ![FuzzyFinder][pic1]
  This really is crucial and what I use constantly. I've been working to
  make better use of Vim's internal cscope system for jumping around files, but
  the power this provides for source and non-source files really is great.<br><br>
  One of the other interesting things about this specific fork is that it was
  abandoned several years ago, but kept functioning in the latest Vim through
  patches on Github. You can view the [network graph here][7] to find the "latest"
  version.

* [`taglist`][8] is a plugin that generates an index of the current file you
  are editing. Having a high level view of all classes and functions really is great.

* [`NERDtree`][9] is a great sidebar file explorer and manager. Easy to browse
  around, easy to create new files, rename, and delete.

### To Be Continued

I wanted to get this initial post out as a base, to start the story of my Vim
configuration files. [Subscribe][10] for future Vim posts!

[1]: http://www.kk.org/cooltools/
[2]: /2010/04/05/my-perfect-osx-terminal-setup/
[3]: /2011/04/02/on-easily-replacing-text-in-vim/
[4]: https://github.com/askedrelic/homedir/blob/master/.vimrc
[5]: http://www.vim.org/scripts/script.php?script_id=2332
[6]: https://github.com/jamis/fuzzyfinder_textmate
[7]: https://github.com/jamis/fuzzyfinder_textmate/network
[8]: http://vim-taglist.sourceforge.net/
[9]: http://www.vim.org/scripts/script.php?script_id=1658
[10]: /code/feed
[pic1]: /pic/fuzzyfinder.png
