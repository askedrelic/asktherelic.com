---
title: An Exploration In Selecting Things
date: 2013-11-03 16:44 PST
tags:
---

Sometime last year, I remember finding a code snippet [to help switch between
Python virtual environments][1], which I added to my `.bashrc`.

```bash
menuvirtualenv() {
    select env in `lsvirtualenv -b`; do
        if [ -n "$env" ]; then
            workon "$env"
        fi;
        break;
    done;
}
alias v.menu='menuvirtualenv'

12:54:26 pcoles@peters_air:~ > v.menu
1) category-cms
2) collect
3) mrcoles
4) readmd
#? 3
(mrcoles)12:54:33 pcoles@peters_air:~/projects/mrcoles >
```

This method for selecting an input stood out to me for being so simple: just
a numbered list. Many command line applications make input too complex, making
the user think about _what_ they want to select, making them type it in
again, while many don't even support tab complete.

Several months ago, I was on an airplane with no internet and decided to
challenge myself to implement that select interface in Python. When looking at
the code again, I found it was just a Bash builtin function:

```bash
select name [ in word ] ; do list ; done
    The list of words following in is expanded, generating a list of items. The
    set of expanded words is printed on the standard error, each preceded by
    a number. If the in word is omitted, the positional parameters are printed
    (see PARAMETERS below). The PS3 prompt is then displayed and a line read
    from the standard input. If the line consists of a number corresponding to
    one of the displayed words, then the value of name is set to that word. If
    the line is empty, the words and prompt are displayed again. If EOF is read,
    the command completes. Any other value read causes name to be set to null.
    The line read is saved in the variable REPLY. The list is executed after
    each selection until a break command is executed. The exit status of select
    is the exit status of the last command executed in list, or zero if no
    commands were executed.
```

I started hacking, got it working, then forgot it about. Now coming back to the
code with an internet connection, I've released it on [PyPI][2] and [Github][3].

### Pyselect

Pyselect wraps `raw_input()`, more or less:

```python
In [1]: import pyselect
In [2]: pyselect.select(['apples', 'oranges', 'bananas'])
1) apples
2) oranges
3) bananas
#? 2
Out[2]: 'oranges'
```

But can also be used as a Python module, when scripting:

```bash
$ python -m pyselect $(ls)
1) LICENSE.txt
2) build/
3) dist/
4) pyselect.egg-info/
5) pyselect.py
6) pyselect.pyc
7) setup.py
8) test.py
#? 4
pyselect.egg-info/
```

Or in a Bash pipe:

```bash
$ ls | xargs python -m pyselect
1) LICENSE.txt
2) build/
3) dist/
4) pyselect.egg-info/
5) pyselect.py
6) pyselect.pyc
7) setup.py
8) test.py
#? 5
pyselect.py
```

But that's where things kind of fall apart. Within a standard interactive Python
application, stdin and stdout are simple and pyselect just works. Getting the
pipe-in to work required a bit more work, hooking in/out up the user's tty,
which the pipe drops. My holy grail would be a pipe-in and pipe-out to make
selecting anything much easier:

```
$ ls | xargs python -m pyselect | cp $0 test.txt
```

Or display all your git branches and jump to one. Or virtualenvs. Or
directories. Double pipe redirects the pyselect output/input and doesn't work.
I've read up on named pipes that might be able to solve this, but I haven't
found a Python solution yet.

To jump between git branches with bash select, I used this:

```bash
function gobranch() {
    select branch in $(git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname)' | sed 's/refs\/heads\///g'); do
        git checkout "$branch"
        break;
    done;
}
```

### Moving Forward

For now, I have some other ideas to try with selecting things:

* Auto-select an option when you have less than 9 options and enter 1-9, no need
  to hit the enter key
* A-Z input, maybe default to home row, ala [vim-easymotion][4]
* Multi-option select, 1-4 ala `git add --interactive` mode
* Integration with Fabric perhaps, which has [some simple input functions][5]

Ideally, pyselect could become "input for humans", ala [Requests][6], because
`raw_input()` could always use a more friendly API.

[1]: http://mrcoles.com/menu-shortcut-activating-virtualenv/
[2]: https://pypi.python.org/pypi/pyselect
[3]: https://github.com/askedrelic/pyselect
[4]: https://github.com/Lokaltog/vim-easymotion
[5]: http://fabric.readthedocs.org/en/1.8/api/contrib/console.html
[6]: http://docs.python-requests.org/en/latest/
