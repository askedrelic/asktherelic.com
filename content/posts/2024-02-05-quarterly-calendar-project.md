---
date: "2024-02-05T12:00:00Z"
slug: quarterly-calendar-project
title: Quarterly Calendar Project
---

Starting out during
[my Recurse Center retreat](/2024/01/05/joining-recurse-w2-2024/), I wanted to
visualize and plan my 12 weeks of time. I’ve been working on “daily streaks” for
habit building and wanted a visual tracker for my habits. Building a printable
quarterly calendar seemed like a good initial project.

Several other printable calendars I’ve found recently, that were inspirational:

- <https://davidseah.com/node/compact-calendar/>
- <https://useminimal.com/>
- <https://neatnik.net/calendar/>

But I couldn't find a “quarter” or 12 week view to cover my Recurse timeframe!

## Choices

My first thought was to stick with a static HTML+CSS page, but I decided to have
the dates be dynamic, which requires Javascript. And once you start doing any
kind of complex Javascript, it’s convenient to use React, inline CSS styling
with your React components, and then it turned into a fully compiled project.
Therefore, I chose,

- Hugo (Go based tool) for the backend and asset compilation
- Tailwind as a CSS framework
- React for organizing my Javascript

Hugo was easy to learn and get started with. It has hot-reload support, which is
important for HTML design work. I initially tried to use static `<script>` tags
for importing React and Tailwind, but moved to a fully imported and compiled
pipeline all inside Hugo, to get importing and tree shaking working. Hugo uses
[esbuild](https://esbuild.github.io), which seems like a really nice optimal
asset compiler.

Two links that helped me understand the Hugo asset pipeline

- [https://www.wictorwilen.se/blog/how-to-add-a-react-script-to-hugo/](https://www.wictorwilen.se/blog/how-to-add-a-react-script-to-hugo/)
- [https://github.com/kaihendry/react-hugo-esbuild/tree/master](https://github.com/kaihendry/react-hugo-esbuild/tree/master)

## CSS Inlining

At this point, I had compiled HTML and Javascript, but CSS was still being
included via a static script tag in the HTML header:

    <script src="https://cdn.tailwindcss.com"></script>

I wanted to inline importing Tailwind CSS, so that I could use it inside my
React code. Tailwind recommends their own separate watch and compile step, like
so:

    npx tailwindcss -i ./src/input.css -o ./src/output.css --watch

But I mostly ignored this. I ran into caching issues in dev and hot-reloading,
where 50% of the time a Hugo rebuild would not pickup my Tailwind CSS changes in
a JS file. I was mostly done with the project, so I didn’t investigate further,
since a full hugo build always worked. I did find several
[tickets with suggested fixes](https://github.com/gohugoio/hugo/issues/8343).

## Print Debugging

The last visual debugging I did was around how the actual printed product
looked! I printed several copies, as I was working, and tweaked some of the font
sizing and colors for clarity. It leaves a nice paper trail of prototypes:

<span class="aligncenter">
[![Literal print debugging][3]][3]
</span>

## Learnings

Here is the finished product: <https://quarterly-cal.asktherelic.com>

Overall, bootstrapping and developing the app were pretty straightforward; I've
done enough HTML+CSS before. Tailwind is a good standard framework for CSS that
makes sense for me.

The hardest part was the Javascript datemath for calculating and rendering out
the week numbers and spacing. I was trying to not import too many libraries, but
not using a JS date library made this more difficult.

Source: <https://github.com/askedrelic/quarterly-calendar/>

![Quarterly Cal][1]

![Quarterly Cal][2]

[1]: /pic/2024-02-02-quarterly-cal-preview.png
[2]: /pic/2024-02-02-quarterly-cal.png
[3]: /pic/2024-02-02-print-debugging.png
