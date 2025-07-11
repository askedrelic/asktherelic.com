---
date: "2009-07-28T22:23:04Z"
slug: svn-line-output-totals
title: SVN Line Output Totals
---

I'm working in a group project currently and annoyed at the lack of output by my
teammates. Wanting hard metrics of how awesome I am and how awesome they aren't,
I wrote this command up.

    svn ls -R | egrep -v -e "\/$" | xargs svn blame | awk '{print $2}' | sort | uniq -c | sort -r

    Output:
        2038 matt
        433 john
        263 ryan
        186 alice
        167 bob

This command will print an full repository listing of all files, remove the
directories, run svn blame on each individual file, and tally the resulting line
counts. It seems quite slow, depending on your repository location, because
blame must hit the server for each individual file. You can remove the -R on the
first part to print out the tallies for just the current directory.

I posted this over at <a title="www.commandlinefu.com"
href="http://www.commandlinefu.com">commandlinefu.com</a> as well for feedback,
so check <a
title="http://www.commandlinefu.com/commands/view/2787/prints-total-line-count-contribution-per-user-for-an-svn-repository"
href="http://www.commandlinefu.com/commands/view/2787/prints-total-line-count-contribution-per-user-for-an-svn-repository"
target="_blank">here</a> for possible helpful commentary of the command! If you
haven't been to commandlinefu before, definitely check it out for some great
one-liner-commands!
