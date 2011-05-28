---
categories: Life
date: 2011/05/29 11:41:56
tags: ''
title: Simple Sidebar Navigation with Sausage.js
draft: false
---

Several weeks ago, a friend linked me to [Sausage.js][1], "a jQuery UI widget for
contextual pagination." I would call it more of a sidebar navigation widget.
The example page was intriguing and prompted me to add it to this blog.

### Requirements

My inital goal was based off the [CouchDB example][2] linked on the Sausage
homepage. I was slowed down by trying to figure out the exact JS and CSS
requirements, which aren't specifically listed out, and some conflicts with my
local CSS for this blog, the main Sausage div requires height 100% and I had
something else set to 100% height which didn't work well...

The main requirements:

* modern jQuery version (I'm using 1.5.2)
* modern jQuery UI widget library (I'm using 1.8.11)
* [Sausage CSS reset][3]
* [Sausage CSS styles][4]

Here is the main code to setup Sausage for my blog:

$$code(lang=javascript)
$(window).sausage({
    page: '.post',
    content: function (i, $page) {
        return '<span class="sausage-span">' + $page.find('h2').first().text() + '</span>';
    }
});
$$/code

### Bugfixing

The main thing Sausage.js provides is a sidebar that updates as you scroll,
showing your current position among the main elements of the page. Great for
blogs or documentation and no need to modify your current docs, since it's
dynamically created on the client.

I wanted to add the ability to jump between elements, which when I looked, was
broken in Sausage and I re-implemented poorly.

$$code(lang=javascript)
$.each($('.sausage'), function (i, e) {
    $(e).bind('click', function () {
        var curTop = $('h2').eq(i).offset().top;
        $(window).scrollTop(curTop - 20);
    });
});
$$/code

Thanks to GitHub, I was able to easily fix the broken scrolling code, offer a
fix, and get some simple navigation on the blog.

[1]: http://christophercliff.github.com/sausage/
[2]: http://christophercliff.github.com/sausage/examples/couchdb.html
[3]: /css/sausage.reset.css
[4]: /css/sausage.css
