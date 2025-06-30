---
date: '2011-03-31T22:51:19Z'
slug: toggle-audio-output-from-the-command-line
title: Toggle OSX Audio Output From The Command Line
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

Since I run a Hackintosh, I am using [my motherboard's][1] internal
audio chipset with 8 channel output, although I'm assuming any Mac Pro or
MacBook system with multiple audio output sources could use this. Internal
speakers is regular out, Line Out is my headphones. Here is my audio panel:

![OSX Audio Panel][2]

At the beginning I found [SoundSource][3] and a few other menubar options
for easily switching audio sources, but they still required work. I searched on
Google and StackOverflow, but only found 30-50 line Applescript scripts which
just controlled the Audio Panel, which seems klunky to me. The first piece of
the puzzle was ["switchaudio-osx"][4] on Google Code which allowed me to
control audio sources from the command line. Download the source, which
contains a binary `SwitchAudioSource`.

Basic usage from a command line is to get a list of audio sources, shows your
current audio source, and chose a new audio source:

```
$ SwitchAudioSource -a
Built-in Microphone (input)
Built-in Line Input (input)
Built-in Digital Input (input)
Built-in Output (output)
Built-in Line Output (output)
Built-in Line Output (output)
Built-in Digital Output (output)

$ SwitchAudioSource -c
Built-in Line Output

/$ ./SwitchAudioSource -s "Built-in Line Output"
output audio device set to "Built-in Line Output"
```

That was enough to do what I wanted from the command line, but to control
SwitchAudioSource from a keypress, I used [Spark][5], an open source
"shortcut manager", which I've [written about previously][6]. Spark
allows to bind anything to custom keypresses. From here, it was figuring out
enough Applescript to use SwitchAudioSource to toggle audio sources properly.
Simple!

![Spark][7]

Code is [here][8] to copy, suit to fit your audio sources and and enjoy!


[1]: http://www.newegg.com/Product/Product.aspx?Item=N82E16813128405
[2]: /pic/audiopanel.png
[3]: http://rogueamoeba.com/freebies/
[4]: http://code.google.com/p/switchaudio-osx/
[5]: http://www.shadowlab.org/Software/spark.php
[6]: http://asktherelic.com/2010/04/12/awesome-osx-software/
[7]: /pic/spark-applescript.png
[8]: https://gist.github.com/897652
