---
categories: Life
date: 2012/05/17 23:11:23
tags: ''
title: Django Deployment Experiences with SeatMe.com
---

Wednesday night [I gave a presentation on][1] how I deploy SeatMe.com @ the
Life360 offices in SF. It was pretty fun and had a good turnout! Here's that
presentation:

<script async class="speakerdeck-embed" data-id="4fb454b6cef64e0022010fa7" data-ratio="1.7297297297297298" src="//speakerdeck.com/assets/embed.js"></script>

One other idea someone had mentioned afterward for running a local PyPI was to
run a Squid proxy in front of PyPI and set a 1 year cache on everything. The
more I think about, it's pretty ingenious and simple, versus running a full
Python app.


[1]: http://www.meetup.com/The-San-Francisco-Django-Meetup-Group/events/62536212/
