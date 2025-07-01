---
date: "2013-08-05T23:08:00Z"
slug: a-newer-branch
title: A Newer Branch
---

This blog is now being built using [Middleman][1], a well documented and quite
flexible Ruby static site generator. I had a pretty good run with
[Blogofile][2], the previous engine used to build this blog: [over three
years][3]. I'm well aware I spend too much time [bike-shedding][4] and
re-tooling sometimes, but the Ruby community keeps pushing things forward and
Middleman has some great features worth upgrading for.

## The Great Solution

Middleman's smart idea is to break everything about a website into a mix of
files, folders, and data. Files can be any format and rendered using any of a
dozen different formats, so if you want to use Markdown or any other format for
writing blog articles, you can. But you can use do Coffeescript for JS files or
Less/SASS for CSS files; they are all just files to be rendered.

The blog is the nicest part: it just picks up specific files that match a date
string format ("Year-Month-Date-Blog-Post-Title") and makes them available as
data to blog rendering templates. You just have BlogArticle objects in the
template and you can use them anywhere in your site. Blogofile and other static
blog rendering engines I've looked at focus on the "blog" abstraction: the
articles and then how the blog is rendered in a specific way. The Middleman
abstraction of "blog" data and "blog" templates makes much more sense to me, but
also opens the doors to building much more powerful and different sites than
just blogs. Well, as long as they are static!

## Other Great Things

Here is my laundry list of thoughts while exploring Middleman:

- Easy to use, flexible rendering system. Doing manual CSS was a pain, but now I
  will probably switch everything to SASS. Dynamic CSS is the only way I think
  about CSS anymore.
- Live reload of pages, via Rack and websockets. Very easy to live edit: web
  browser on half screen, editor on half screen.
- Great docs explaining everything about Middleman; there aren't many options,
  but they are explained well.
- Self introspection to figure out problems: while developing you can goto
  `http://localhost:4567/__middleman/` and view your dynamic configuration or
  sitemap
- Great built in support for build time site optimizations: auto-gzip of all
  files, auto CSS/HTML minification, auto image shrinking, all ensuring your
  built static site is very fast.
- Since everything is just files and folders, you can have a folder for each
  blog article, to keep related, like source code or presentations mentioned in
  the article. It makes it really easy to setup a "code example" HTML page as a
  sub-directory of the blog post, which is great to keep everything on the blog
  itself.

I've also disabled comments on this blog. It's been a few fun years with Disqus,
but it's easier to me if people reach out on [Github][5] or [Twitter][6], while
I can focus on writing on the blog, which I continually hope that I find more
time for.

If you want to check out the source, [it's always on Github][7].

[1]: http://middlemanapp.com/
[2]: http://blogofile.com/
[3]: /2010/02/25/a-new-branch/
[4]: https://github.com/askedrelic/homedir
[5]: https://github.com/askedrelic
[6]: https://twitter.com/askedrelic/
[7]: https://github.com/askedrelic/asktherelic.com
