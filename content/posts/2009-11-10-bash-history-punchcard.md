---
date: "2009-11-10T21:13:54Z"
slug: bash-history-punchcard
title: Bash History Punchcard
---

I love the punchcard graph on GitHub, showing the hourly/daily/weekly output of
a project in a nice and neat format. I decided to apply the punchcard format to
my Bash history, one of the random bits of data I have lying around.

By default, Bash just stores history commands sequentially with a number and the
command. To store the command with a timestamp, you must set the HISTTIMEFORMAT
variable in your bashrc. That variable is used to format the output from
"history", but it must be set to something for Bash to store the timestamp.

    export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S - '

With a timestamped `.bash_history` file, you can figure out when you were using
your terminal! Someone else had [already come up with this idea][1] using git
history data, so I borrowed most of their code and created a new project on
github.

[github.com/askedrelic/Bash-History-Punchcard][2]

Sample output from my account on this server (thebehrensventure.com)

<span class="aligncenter">
[![asktherelic history chart][3]][3]
</span>

Sample output from my main machine (jofur)

<span class="aligncenter">
[![jofur history chart][4]][4]
</span>

So for both of these, my bash history goes back about 7 months, when I turned on
the variable. It's not 100% accurate either because I have duplicates being
ignored and some other settings altering my bash history. It looks like
Tue/Wed/Thur are my big days for getting stuff done!

[1]: http://dustin.github.com/2009/01/11/timecard.html
[2]: http://github.com/askedrelic/Bash-History-Punchcard
[3]: /pic/asktherelic-historychart.png
[4]: /pic/jofur-historychart.png
