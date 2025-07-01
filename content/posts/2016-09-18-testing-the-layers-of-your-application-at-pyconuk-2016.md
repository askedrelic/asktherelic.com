---
date: "2016-09-18T18:00:00Z"
slug: testing-the-layers-of-your-application-at-pyconuk-2016
title: Testing the Layers of Your Application at PyConUK 2016
---

This weekend, I presented at [PyConUK 2016][1], summarizing my recent
experiences testing Python webpapps and libraries.

I've been writing Python for about 8 years now, mostly on a smaller scale, but
the last few years at Yelp have been really interesting to see testing done at a
larger scale. Testing has become really important to me, as it helps all the
other pieces of your software fit together better.

It was great to be able to share what I've learned and brush up on my
presentation skills. Unfortunately, I didn't manage to record a video of the
actual presentation, but that was also a lesson learned for when you are
presenting.

## Abstract

_Testing is a best practice for delivering reliable software, but it can be a
hard subject when starting out. What should you test and why? How much testing
is enough? So you spent three days and wrote out tests for everything in your
module, but was that an effective use of your time?_

_This talk will give an overview of the different layers that you can write
tests for and why you should have them. You start with unit tests, mix in some
integration tests, and cover with acceptance tests. Sprinkle with specific
testing tools to taste. Tools we’ll discuss include py.test, docker, behave,
tox, and coverage. Although the talk focus will be on web apps, the ideas will
be relevant to all Python applications._

_Writing quality tests is important: flaky tests will cost more time than they
save and filler tests that don’t test important areas will weigh you down over
time. With stable and effective tests for all layers, you build code you can
trust, that you can refactor quickly or change easily without breaking
everything. It’s as easy as cake!_

<script async class="speakerdeck-embed" data-id="0abd7ed7db86400dac9dd882b66cc323" data-ratio="1.77777777777778" src="//speakerdeck.com/assets/embed.js"></script>

[1]: http://2016.pyconuk.org/
