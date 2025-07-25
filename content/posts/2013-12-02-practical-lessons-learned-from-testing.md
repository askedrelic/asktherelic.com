---
date: "2013-12-02T21:21:00Z"
slug: practical-lessons-learned-from-testing
title: Practical Lessons Learned From Testing
---

After recently [joining a much larger company][1] and taking a look at my team's
product from different perspectives, I've found new value from testing. While
running a small startup exploring a business market, trying new features was
a daily or weekly affair; you have to make tradeoffs with code quality, feature
set, or speed of delivery. Code testing, especially in quantity of unit tests,
had been something I usually traded for speed of delivery. If I can deliver
a feature that looks correct from a high-level business perspective, then the
code is probably correct based upon my experience with the programming language.
However, no programmer is perfect and preparing for failure is a good idea.

## Basic Testing

Testing can be approached from many different ways, with different goals. At the
unit test level, you are essentially testing your API:

- is the API easy to use; how hard is the code to test (a great smell for bad
  code)
- did I really build what I wanted to build
- is it extensible; how many dependencies does the code have

This what many developers think tests are. I have always felt these were
important from an academic standpoint, but definitely never gave them their due
respect. Unit tests are a great way to explore your code and reflect whether it
still makes sense on a second glance. No matter how trivial or simple the code
may be, having the ability to change your mind repeatably, with verified
results, is useful.

Moving to a higher level, functional or system tests are good to determine if
3rd-party libraries and your application as a whole is working correctly, and
usually where I have spent much of my time from a return on time investment.
Either the system works or it doesn't and this can be traced down quickly. This
is something I have begun to focus less on, due to getting better gains from
improved unit testing. This is basically the debate over [top-down versus
bottom-up][2] design and I think testing at both ends of the spectrum is
important.

## Communicating The Code

This point has been one of the bigger breakthroughs I've made: tests communicate
the spec. When I'm building a feature, I usually iteratively write code until
I say it works. I'm continually running the code and I am doing the evaluating
of the output to determine that the computer is generating correct output. But
moving that evaluation step into into code and automating is a big, very useful,
step. This is essentially [BDD][3]; letting business people write a code spec
and having to match that spec.

Once a feature has been communicated into a code spec, changing that feature
later becomes a migration; not having to start from scratch to ensure all my
assumptions still work with subtle changes.

As my team has gotten larger, being able to say my code does something and then
have a test to prove it helps with async communication and increases the speed
of integration. Having a second source of code truth keeps everyone on the same
page about what the code is doing and helps smooth the merge process.

For an open source project, having public tests helps show your concern for code
quality and is an easy way for knowledgeable developers to jump into your code:
how do I use your code? Well, I can always check out the tests because they
better work. Across many projects, documentation is pretty rare or of poor
quality. Both tests and documentation are important for your project, but while
documentation fades with time, test code has a very binary usefulness.

## Check Yo Self Before You Wreck Yo Self

Coming from doing most of my coding in Python and dynamic languages, this
concern may not be as important in static languages like C#/Java, but I think it
is still important.

Tests help verify your assumptions. Returning to my original point, failure will
happen and trying to plan for is a much better solution than waiting until it
happens. Dynamic typing makes it faster to write code and but pushes many errors
to become runtime errors. The number of times I've run into date/time/datetime
conversion errors in Python has definitely pushed me to test more. I can assume
what code is doing all day long, until I actually test it and find that one
instance when the API does something you weren't expecting. Even assuming that
you really understand dates or [timezones][4] is often incorrect.

When you run into a new problem, having a test environment setup that you can
easily jump into will save time and get you fixing things quicker. The more you
invest in the test environment, the easier it is to solve new types of problems
and quickly diagnose problems when they arise.

## In Closing

How much to test, what areas to test, what type of testing to use: these
questions are always up for debate. Any level of testing is good and you can
probably improve. In the world of [GitHub][5], you rarely code "alone"; someone will
always read your code and making it easier for them to read and analyze is
a good thing. Finally, double checking yourself is a good thing. Testing is an
investment, sometimes the return may take awhile to surface, but improving your
testing ability is one step to becoming a better programmer.

[1]: /2013/08/22/the-birthday-surprise/
[2]: http://superprofundo.com/2010/12/13/top-down-and-bottom-up-pros-and-cons/
[3]: http://en.wikipedia.org/wiki/Business-driven_development
[4]: http://blog.counsyl.com/2013/09/27/true-facts-about-time-zones/ "Seriously, what the hell"
[5]: http://github.com/askedrelic/
