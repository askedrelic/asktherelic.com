---
title: GIT Line Totals Per Author 
categories: Life
date: 2009/10/24 21:58:17
tags:
    - code
---

I finally switched all of my projects over to git or git-svn and have never been
happier. Everything has so many more options than svn, everything is faster, and
the universe of software for git is way better than svn. Switch now!

Awhile back I wrote a command to print the total number of lines contributed per
author for my svn repository because I wanted to see how awesome I am. I decided
to port this command over to git.


```shell
git ls-files | xargs -n1 -d'\n' -i git blame {} \ 
| perl -n -e '/\s\((.*?)\s[0-9]{4}/ && print "$1\n"' \ 
| sort -f | uniq -c -w3 | sort -r

Output:
    217167 mattb
    11592  bob
    3975   alice
    1276   jim
    358    tom
    64     brad
    13     Not Committed Yet
```

This output includes a bunch of binary files which throw off the total.  If you
mess with the ls-file options, you can remove them or only include specific
source filestypes.

```shell
#to remove really random binary files
git ls-files -x "*pdf" -x "*psd" -x "*tif"  
#to only include specific file types
git ls-files "*.py" "*.html" "*.css" 
```

I crossposted this over at <a
href="http://www.commandlinefu.com/commands/view/3889/prints-per-line-contribution-per-author-for-a-git-repository">commndlinefu</a>,
so there might be some helpful feedback over there too.
