---
title: Streaming Small HTTP Responses with Python
date: 2013-11-20 09:39 PST
tags:
---

For a recent hackathon project, I wanted to setup a client/server
configuration, all in Python, so that the server could run shell commands and
stream the output back to the client. The client was a Raspberry Pi and the
server was my laptop, which already had my real project setup.

My first thought was to do this over HTTP, with [Requests][1] for the client
and [Bottle][2] for the server. I started writing some code, checked the Bottle
docs for [sending a streaming response][3], and was running with a few lines.

```python
import bottle
import subprocess

@bottle.route('/stream')
def stream():
    proc = subprocess.Popen(
        'echo 1 && sleep 3 && echo 2 && sleep 3 && echo 3',
        shell=True,
        stdout=subprocess.PIPE,
    )
    while proc.poll() is None:
        output = proc.stdout.readline()
        yield output + "\r\n"

bottle.debug(True)
bottle.run(host='0.0.0.0', port=8000, reloader=True)
```

This code worked great in Chrome; console output was streamed with pauses and
the connection was not dropped.

Then I started on a client in Python. Requests also [supports streaming
responses][4], just a parameter to the standard `requests.get()`, nothing too
major.

```python
import requests

r = requests.get('http://0.0.0.0:8000', stream=True)
for line in r.iter_lines():
    print line
```

### The First Mistake

After running the client a few times, the output wasn't getting streamed.
Output would pop in, as if the response was fully downloading before printing.
I tried increasing the sleep amount, to see if the response was too short and
tweaking the python handling of output, trying to find some sort of implicit
stdout buffering with `export PYTHONUNBUFFERED=True`. I rewrote the server in
[Flask][5], which offers the same streaming capabilities as Bottle, but
encountered the same situation with the client not streaming the response.
After consulting with teammates, we couldn't see the problem and moved on to
trying to stream a local SSH connection instead, which had its own host of
environment problems.

The one variable I didn't tweak in these examples was the response size, which
seems obviously when looking back now. My first mistake was not testing
boundary cases: all the minimum viable tests were extremely small and not
extremely different. I moved on too quickly without diving deep enough into the
problem: the docs and samples were all so simple, so I assumed nothing could be
wrong with the libraries I'm using.

### The Second Mistake

This hackathon was all for fun, so I gave up and moved onto the next problem,
but I returned the next day and dived deeper. My second mistake was trusting
the docs: documentation is a great resource, but code never lies.

After looking at the function declaration for the [`response.iter_lines()`][6],
it quickly made sense: the default chunk size for the lines in the response was
512 bytes, which `1 2 3` would never get chunked into multiple pieces. I was
also not sending `\r\n`, the standard [HTTP chunked terminator][7].

```python
ITER_CHUNK_SIZE = 512
def iter_lines(self, chunk_size=ITER_CHUNK_SIZE, decode_unicode=None):
```

Setting `chunk_size=1` made my client immediately print output, solving all my
problems.

### For Next Time

To make testing easier, I've created a Github repo to demo all this code:
[https://github.com/askedrelic/streaming-demo][8].

While debugging this situation, I remembered to try HTTPie, [a cURL replacement
written in Python using Requests][9], which handled the streaming response
correctly. Looking at HTTPie's code for consuming responses, led to me look at
Request's code and figure everything out. Definitely recommend this tool!

Lastly, always check the code and don't be afraid to dive deep.


[1]: http://docs.python-requests.org/en/latest/index.html
[2]: http://bottlepy.org/docs/dev/
[3]: http://bottlepy.org/docs/dev/tutorial.html#generating-content
[4]: http://docs.python-requests.org/en/latest/user/advanced/#streaming-requests
[5]: http://flask.pocoo.org/docs/
[6]: https://github.com/kennethreitz/requests/blob/v2.0.0/requests/models.py#L593
[7]: http://en.wikipedia.org/wiki/Chunked_transfer_encoding
[8]: https://github.com/askedrelic/streaming-demo
[9]: https://github.com/jkbr/httpie
