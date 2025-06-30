---
date: '2010-09-05T22:44:22Z'
slug: large-graphs-with-google-chart-api
title: Large Graphs with Google Chart API
---


Yesterday, I saw forum post about predictions for when a video game (DNF) would
get released. That prompted me to generate a multi-year vertical bar chart
graphing the number of predictions per month/year over the last several years
and I felt like sharing the process.

I love making graphs. I also love using Google's Chart API for making quick but
decent looking graphs. They get the job done easily and since it is an HTTP API,
it's easily to manipulate, share, and program. Unfortunately, the Chart API has
a limit of 1000px wide or tall for your largest image, which I easily hit with
my multi-year graph, but you can get around that by using the Python Image
Library (PIL) to stitch together multiple smaller graphs.

While making this graph, I identified three main points that would probably help
in making future graphs:

1. Normalize your input data. Get a uniform date format that is easy and
flexible to work with first, separate from your graph making code.

2. Build a blank graph first, get the layout/look down, then build the graph
with data.

3. Know when stop using the API or your code to build the graph and switch to
   Photoshop to finish off the details. Time/effort trade-off, but for me, final
   layout of the graph and fonts, text, minor things are way easier to finish
   outside of the code.

On to the code! I'm skipping the data formatting/normalizing parts from this
code, it's mundane. This is using pygooglechart 3.0 and PIL 1.6, Python 2.6. The
full code [is located on Github][1].

First, we setup out basic graph. With the 1000px limit, we can create three
years of graph at a time.

![Simple three year graph with axes lined up](/pic/2002-2005.png "Simple three year graph with axes lined up") 

Python's list comprehensions make generating random data formats for graphs
quite easy! Here we are using the calendar modules built in listing of month
abbreviations to generate the months, then the year date below.

```python
#build the monthly abbrevations
months += [x for x in calendar.month_abbr if x]
#build the empty year array
years += [''] * 12
#then fill in January position
years[y * 12] = ' %s' % start_year
```

After we have generated multiple three year graphs, we can join them together
into one huge graph using the PIL to crop and paste them together. We create
a large blank image first, then paste the first graph, then crop the other
future graphs to remove their y axis labels. The specific crop values come from
trial-error, but they are easy to figure out.

```
#new large canvas to work with
nim = Image.new("RGB", (5000,300), "white")
for file in glob.iglob('20*-*.png'):
    #if the first graph, start at 0
    if counter == 0:
        im = Image.open(file)
        nim.paste(im, (0,40))
    #otherwise, crop the y labels from future graphs
    else:
        im = Image.open(file)
        im = im.crop((18,0,825,250))
        nim.paste(im, (x,40))
        x += 790
```

Then we wind up with a huge 5000px x 250px graph [here][2]. Having a blank
yearly based template is useful for alot of data, but this could be generalized
easily to daily data, or hourly data.

[1]: http://gist.github.com/566547 "Timeline graph code"
[2]: /pic/long-graph.png "Many years of data"
