---
categories: Life
date: 2011/08/16 00:32:46
tags: ''
title: Journaling
draft: false
---

I'm releasing 0.1 of Journal, a simple Python CLI tool to help with keeping
a journal for work/personal stuff! Inspired by Peter Lyons' [article on career
development][1], I decided to write up a script to help manage things.

The idea from Lyons' article is to keep a chronological log of everything you do
at your job. This mirrors my own experiences with working so far: keeping
meticulously notes of what I'm doing is always helpful and not too much extra
work, since I always carry a notebook around with me for this purpose. Now I can
keep things digital!

###Install

The script is located on Github here: [https://github.com/askedrelic/journal][2]

You can install with:

    $ pip install journal

The journal command should now be available on your command line and you can
journal like so:

    $ journal "Task foo completed"

and a `~/.journal/[CURRENT DATE].txt` file will be created using the current
date, with a timestamp and your entry. Just continue to enter your tasks through
the days and weeks and build a record of your work.

###Thought Process

For interest, here was my progression of work in creating this tool:

1.  Creating a journal using Bash isn't really that hard:

    (bsd style for OSX)

    ``$ echo -e `date`"\n-work completed\n" >> ~/`date "+%Y-%m-%d.txt"` ``

2.  I looked for existing projects that may have already solved this problem.

    I found [work_log][3], a Ruby script more oriented for tracking time. I got
    some good ideas for how the CLI interface should work, but this program
    didn't quite solve my problem.

    There are existing blogging solutions, but a blog is heavy-weight and mostly
    something you manage through the web. I prefer KISS and keeping things on
    the console.

3.  Then I rolled my own!


[1]: http://peterlyons.com/leveling_up.html
[2]: https://github.com/askedrelic/journal
[3]: https://github.com/fabrik42/work_log
