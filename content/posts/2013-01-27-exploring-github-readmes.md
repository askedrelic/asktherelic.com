---
date: "2013-01-27T17:32:04Z"
slug: exploring-github-readmes
title: Exploring GitHub READMEs
---

Over the last few years, I've integrated and used many different open source
projects, looking at a wide range of code quality, documentation, and project
organization. Code is just one part of a project, first impressions matter, and
especially when deciding to add a dependency to your project, you want to judge
a project on many different metrics.

READMEs are a big first impression. They can summarize your project, show quick
getting started documentation, licensing information, and are a good metric
about the overall state of your project. GitHub has pushed especially hard for
developers to use READMEs, in trying to make open source projects more
digestible to everyone.

I was recently wondering about the state of READMEs in GitHub and since it's so
easy to parse things out of GitHub, I started hacking today and found some quick
numbers.

## Getting Started

First, I wanted a good set of data. GitHub keeps a [list of popular repos][1]
but it's not part of the v3 API as far as I could see. I couldn't find any easy
list of the 1000 or so Top Starred GitHub Repos, so I parsed out the top 20
watched repos from each of the 90 languages that Github tracks and decide to
call that a good list.

Here is the code using Requests plus shitty regex

<script src="https://gist.github.com/4651871.js"></script>

## Parsing Markdown

With a list of "popular" repos (1784 count), I used the GitHub API to determine
whether a repo had a README and then started parsing out the README type.

<script src="https://gist.github.com/4651896.js"></script>

## Initial Results

From the 1784 repos, only 15% (278) don't have any README!

Of the 85% (1505) with READMEs, about 58% (884) are specifically Markdown
format. I'm still figuring out the rest, they are either txt format or no
format.

The average README byte size is 3455, with median of 1753.

Here is a CSV of repos with URLS: [https://gist.github.com/4651905][2]

Here is the CSV of repos from which this initial information was estimated:
[https://gist.github.com/4651912][3]

## Going Forward

My next goal is to parse out headers and identify README structure and content;
what percentage of repos have a license in their README, have a quick change
log, have example docs, or what the average structure of a README is.

All code is going to live at
[https://github.com/askedrelic/github_introspection][4], it's a mess of stuff
pulled from IPython right now, but will improve (and get a better README too!).

Ideally, I would like to be able to parse out a suggested header index and build
out a README generator. By analyzing the community of popular repos, popular
standards can be identified.

Open source project organization has always been a big interest to me, with the
goal of making my projects more palatable and in trying to improve the overall
quality of all open source projects.

[Lice][5] is a similar tool for auto generating license information.
[DocumentUp][6] is another great tool to generate a much more readable README
format for your repo, but I would love to have the README be a more useful and
structured piece of information for a project.

[1]: https://github.com/repositories
[2]: https://gist.github.com/4651905
[3]: https://gist.github.com/4651912
[4]: https://github.com/askedrelic/github_introspection
[5]: https://github.com/jcarbaugh/lice
[6]: https://github.com/jeromegn/DocumentUp
