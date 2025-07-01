---
date: "2011-06-22T22:33:49Z"
slug: fabric-for-python-automation
title: Fabric for Python Automation
---

I gave a talk earlier tonight at the local [Python usergroup][1] on Fabric, a
Python library for "application deployment." I've mentioned Fabric before on
here, documenting how to [create dynamic Fabric commands][2].The presentation
went well, but I was most interested in the reception of the talk and how I
targeted the talk.

I gave a talk earlier tonight at the local Python usergroup on Fabric, a Python
library for “application deployment.”

<script async class="speakerdeck-embed"
data-id="8e357540dfa60130dca216e8f5cd5baf" data-ratio="1.33333333333333"
src="//speakerdeck.com/assets/embed.js"></script>

From the Fabric docs, Fabric targets itself as a sys-admin and deployment tool.
Many in the crowd had that impression as well, trying to compare it to Chef,
Puppet, or Capistrano. My comparison has always been to Rake or Make, although
not so much Make, in terms of working with local file dependancies and source
code compilation. It's easier to start out with than Chef/Puppet, but doesn't
get as complex as either program.

I view Fabric as a great automation library, for local and remote tasks. For not
just automating deployment, but automating doc generation, running tests, or any
Python or Bash command that you find yourself running repeatedly, remote or
locally. It's applicable to any project with repeatable tasks, not just for
Python projects. I will try to improve on this presentation and hopefully be
able to better sell Fabric next time.

[1]: http://twitter.com/#!/pghpy
[2]: /2011/02/17/dynamic-fabric-commands-for-managing-cloud-servers
