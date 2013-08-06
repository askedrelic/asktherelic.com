---
categories: Life
date: 2011/06/19 22:59:04
tags: ''
title: Weekend Python Hacking
---

I've been able to get some time and focus this weekend to hack on a few Python
side projects. In the sense of learning and self documentation, here are some
things I learned:

* Know the difference between `__str__` and `__unicode__` (and `__repr__`).
  Don't put Unicode in your str unless you want random unicode exceptions. An
  interesting snippet to get the best of both worlds:

    ```
    def __str__(self):
        return unicode(self).encode('utf-8')
    ```

* I wish Python packaging and "building a module" best practices was simply laid
  out somewhere. I found [this guide][1] for Ruby gems early last week and was
  very satisfied. One page, simple code and directory listings, best practice
  suggestions, from step one to published including a recommendation for
  testing. The closest thing I've found for Python recently has been 
  [this guide][2].

* I know enough to use virtualenv + pip + a `requirements.txt` file to build a clean
  environment. But damn, I'm still figuring out setuptools, distribute,
  distutils and distutils2. Actually, continuation of my comment above, 
  [this chapter][3] on Python Packaging has been one of the best recent guides I've
  found. The whole "The Architecture of Open source Applications" book is
  fantastic, a great high level and detailed view into so many projects. But
  back to `setup.py`: what's required, what's not? It's a flexible wrapper that
  everyone does different. I'm still learning new commands for setup.py all the
  time. It's been frustrating.

* Best new command `setup.py` command: `python setup.py develop` It installs
  a link in your site-packages to your development module, so you can use it
  locally. Great idea!

* I found [this skeleton][4] repo for a suggested package layout. I like it and
  wish I could find more skeletons.

* Inline class documentation: I've seen enough evidence to suggest that
  reStructuredText (reST acronym?) is the preferred way, for readability and
  generated docs. I like Javadoc syntax for Java and PHP, but haven't seen much
  support in Python. Kenneth Reitz's [Requests][5] HTTP library is a great,
  [well documented][6], example. Related: [ReadTheDocs][7] is a fantastic site
  and I really love who ever launched it. Great for whenever the Django website
  goes down, or for viewing a specific version of docs. Viewing Django's "dev"
  version of the docs and finding new methods that you can't use is always
  annoying.

* Reminder for personal projects: start small. I get so wrapped up in these
  details, that I sometimes never finish anything useful. Someone has to worry
  about the details, but start small and finish something useful before you go
  trying to fix everything you think is broken.


[1]: http://guides.rubygems.org/make-your-own-gem/
[2]: http://reinout.vanrees.org/weblog/2010/02/22/packaging-with-setuptools.html
[3]: http://www.aosabook.org/en/packaging.html
[4]: https://github.com/ctb/SomePackage
[5]: https://github.com/kennethreitz/requests/
[6]: http://readthedocs.org/docs/requests/en/latest/api/
[7]: http://readthedocs.org/
