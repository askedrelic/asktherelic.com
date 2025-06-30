---
date: '2010-05-23T21:05:53Z'
slug: an-interactive-python-workflow
title: An Interactive Python Web Scraping Workflow
---

I've been doing a fair amount of screen-scraping and reverse-engineering of web applications recently and wanted to share my workflow. When working with dynamic web applications whose output is dynamic or unknown, Python's REPL (Repeat Eval Print Loop) combined with IPython is great choice for quickly getting something working. Python's built in libraries combined 3rd party libraries 

Say I wanted to emulate a normal user in a web browser. First I would make a request to a homepage, then I would browse deeper into the website.

For another great interactive way to test HTTP request, check out Hurl.


>ipython
   http://hurl.it/ for simple http request
   ipython %page
   %magic
   ?
   better than curl

%history 100
interactive help
help on objects via ? or ??
