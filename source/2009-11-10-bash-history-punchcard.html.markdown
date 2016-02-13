---
categories: Life
date: 2009/11/10 21:13:54
tags: ''
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
your terminal! Someone else had <a
href="http://dustin.github.com/2009/01/11/timecard.html">already come up with
this idea</a> using git history data, so I borrowed most of their code and
created a new project on github.

<a
href="http://github.com/askedrelic/Bash-History-Punchcard">http://github.com/askedrelic/Bash-History-Punchcard</a>

Sample output from my account on this server (thebehrensventure.com) <a
href="http://thebehrensventure.com/wp-content/uploads/2009/11/asktherelic-historychart.png"><img
src="http://thebehrensventure.com/wp-content/uploads/2009/11/asktherelic-historychart-500x187.png"
alt="asktherelic-historychart" title="asktherelic-historychart" width="500"
height="187" class="aligncenter size-medium wp-image-736" /></a>

Sample output from my main machine (jofur) <a
href="http://thebehrensventure.com/wp-content/uploads/2009/11/jofur-historychart.png"><img
src="http://thebehrensventure.com/wp-content/uploads/2009/11/jofur-historychart-500x187.png"
alt="jofur-historychart" title="jofur-historychart" width="500" height="187"
class="aligncenter size-medium wp-image-737" /></a>

So for both of these, my bash history goes back about 7 months, when I turned on
the variable. It's not 100% accurate either because I have duplicates being
ignored and some other settings altering my bash history. It looks like
Tue/Wed/Thur are my big days for getting stuff done!