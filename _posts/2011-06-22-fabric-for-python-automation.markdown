---
categories: Life
date: 2011/06/22 22:33:49
tags: ''
title: Fabric for Python Automation
draft: false
---

I gave a talk earlier tonight at the local [Python usergroup](http://twitter.com/#!/pghpy) on Fabric, a Python
library for "application deployment." I've mentioned Fabric before on here,
documenting how to [create dynamic Fabric commands][1].The presentation went
well, but I was most interested in the reception of the talk and how I targeted
the talk.

[Here is my presentation](https://docs.google.com/present/edit?id=0AcvwZqy5XUWkZGN6eGp4ZHFfMjZmYmg2cjNjdw&hl=en_US).

From the Fabric docs, Fabric targets itself as a sys-admin and deployment tool.
Many in the crowd had that impression as well, trying to compare it to Chef,
Puppet, or Capistrano. My comparison has always been to Rake or Make, although
not so much Make, in terms of working with local file dependancies and source
code compilation. It's easier to start out with than Chef/Puppet, but doesn't
get as complex as either program.

I view Fabric as a great automation library, for local and remote tasks.  For
not just automating deployment, but automating doc generation, running tests,
or any Python or Bash command that you find yourself running repeatedly, remote
or locally. It's applicable to any project with repeatable tasks, not just for
Python projects. I will try to improve on this presentation and hopefully be
able to better sell Fabric next time.

[1]: http://asktherelic.com/2011/02/17/dynamic-fabric-commands-for-managing-cloud-servers
