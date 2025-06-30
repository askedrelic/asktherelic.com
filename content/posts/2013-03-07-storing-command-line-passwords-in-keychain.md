---
date: '2013-03-07T22:38:21Z'
slug: storing-command-line-passwords-in-keychain
title: Storing Command Line Passwords In Keychain
---


Over the last year, I've made the effort to get most of my passwords into
[1Password][1]. It's pretty nice to only have to remember one password, along
with easily with increasing your overall online security. Whenever another bank
or website gets their password list stolen, I'm not concerned because my
password for that site was "0RLrA4GQeGlRZR" or some other gibberish that was
unique to that specific site.

Anyways, I still use a bevy of command line tools that mostly keep their
passwords in .cfg files or $ENV variables in my home directory. It's frustrating
to have plain text passwords lying around, even if they are just random tokens.

[Pianobar][2] is a very cool command line program for playing Pandora songs that
gets it right. It supports username and password in its config, but it also
supports a `password_command` option, which lets another program store your
passwords in a secure manner. Hence, I've wired things up to use the OSX
Keychain.

### Accessing The Keychain

The main magic is a shell script `get_keychain` that uses built-in OSX commands
to lookup passwords in the Keychain:

<script src="https://gist.github.com/askedrelic/5114346.js"></script>

Then `password_command` is

```
password_command = get_keychain pianobar
```

Which prompts to access my Keychain:

![Pianobar][3]

### Setting Up The Keychain

This is the area I am hoping to improve. 1Password doesn't really have an API
for "accessing" passwords, so I manually entered my pianobar password into the
Keychain. Perhaps this would be reason to switch to [KeePass][4], which I'm
assuming has an API.

I'd imagine some sort of Applescript magic could create a Keychain <> 1Password
bridge.

### Hopefully Good Ideas Spread

Specifically, the [Python .pypirc][5] has frustrated me recently with forcing me
to store a clear text password or no password, but there are plenty of programs
I would love to switch to not using a read-only config format.

Actually, while writing this post, I went digging and found two Python APIs that
can read the 1Password database format, which makes the above Keychain bridge
unnecessary!

* [1pass][6] (Python2)
* [secret-archer][7] (Python3)

I will have to investigate this 1Password integration further.


[1]: https://agilebits.com/onepassword
[2]: https://github.com/PromyLOPh/pianobar
[3]: /pic/pianobar-password.png
[4]: http://keepass.info/
[5]: http://docs.python.org/2/distutils/packageindex.html#pypirc
[6]: https://github.com/georgebrock/1pass
[7]: https://github.com/plaguemorin/secret-archer
