---
categories: Life
date: 2011/03/31 22:51:19
tags: ''
title: Toggle OSX Audio Output From The Command Line
draft: false
---

I spend alot of time at my computer and with that much usage, have both
speakers and headphones for different hours of the day. I was initially
physically swapping 3.5MM audio output plugs on my speakers, lotsa actual
effort! I then figured out I could plug my headphones into the "rear" speaker
output and switch output through the audio control in OSX, much easier! But
that was even work, to open the audio panel and chose the correct
source, so today I figured out how to toggle sources in Applescript and the
command line. I then bound that script to a keypress and now I can toggle audio
sources much easier!

Since I run a Hackintosh, I am using [my motherboard's][motherboard] internal
audio chipset with 8 channel output, although I'm assuming any Mac Pro or
MacBook system with multiple audio output sources could use this. Internal
speakers is regular out, Line Out is my headphones. Here is my audio panel:

<span class="aligncenter">
![OSX Audio Panel][audiopanel]
</span>

At the beginning I found [SoundSource][source] and a few other menubar options
for easily switching audio sources, but they still required work. I searched on
Google and StackOverflow, but only found 30-50 line Applescript scripts which
just controlled the Audio Panel, which seems klunky to me. The first piece of
the puzzle was ["switchaudio-osx"][switch] on Google Code which allowed me to
control audio sources from the command line. Download the source, which
contains a binary `SwitchAudioSource`.

Basic usage from a command line is to get a list of audio sources, shows your
current audio source, and chose a new audio source:

$$code(lang=sh)
ruin:~/$ SwitchAudioSource -a
Built-in Microphone (input)
Built-in Line Input (input)
Built-in Digital Input (input)
Built-in Output (output)
Built-in Line Output (output)
Built-in Line Output (output)
Built-in Digital Output (output)

ruin:~/$ SwitchAudioSource -c
Built-in Line Output

ruin:~/$ ./SwitchAudioSource -s "Built-in Line Output"
output audio device set to "Built-in Line Output"
$$/code

That was enough to do what I wanted from the command line, but to control
SwitchAudioSource from a keypress, I used [Spark][spark], an open source
"shortcut manager", which I've [written about previously][previously]. Spark
allows to bind anything to custom keypresses. From here, it was figuring out
enough Applescript to use SwitchAudioSource to toggle audio sources properly.
Simple!

<span class="aligncenter">
![Spark][spark-apple]
</span>

Code is [here][gist] to copy, suit to fit your audio sources and and enjoy!

[motherboard]: http://www.newegg.com/Product/Product.aspx?Item=N82E16813128405
[audiopanel]: /pic/audiopanel.png
[source]: http://rogueamoeba.com/freebies/
[switch]: http://code.google.com/p/switchaudio-osx/
[spark]: http://www.shadowlab.org/Software/spark.php
[previously]: http://asktherelic.com/2010/04/12/awesome-osx-software/
[spark-apple]: /pic/spark-applescript.png
[gist]: https://gist.github.com/897652
