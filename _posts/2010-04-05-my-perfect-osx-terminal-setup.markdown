---
categories: Life
date: 2010/04/05 14:44:13
tags: ''
title: My Perfect OSX Terminal Setup
---
As a programmer and a part-time sysadmin, I spend a huge amount of time in the OSX Terminal and find it be one of the better CLI environments I've used, after some tweaking. Windows + Powershell or CMD (shudder) is just terrible. Linux with Xterm comes close, but doesn't have the same easy usability that I enjoy about the OSX Terminal. Today, I'd like to share my tweaks and explain what I enjoy about them.

Here is my general color scheme/terminal look. I'm running OSX 10.6.3 with 64-bit Terminal. All of these tweaks depend on [SIMBL](http://www.culater.net/software/SIMBL/SIMBL.php), a bundle loader which loads these tweaks. I'm running version 0.9.7a.

<span class="aligncenter">
![Pretty colors!](/pic/terminal1.png "terminal colorscheme")
</span>

###Visor
[Visor](http://visor.binaryage.com/) is a "system-wide terminal on a hot-key". I have Visor bound to `Apple ~`. Having simple access to the Terminal whenever I want is very important.

Visor also adds "copy on select", a very useful little tweak for text. Additionally, it allows you bind the Terminal to a specific position; having it drop down from the top and take up 50% of the screen, reminiscent of the Quake style visor. I bind my Visor to use the full screen.

###Terminal Tab Switching
Visor only uses one main window, which means you can have multiple tabs in the window. Getting easy access to the specific tab I want is very important. Chrome, Firefox, and many other tab based applications bind `Apple 1-9` to the specified tab location and I like having that functionality in Terminal. I rarely work with more than 9 tabs anyways.

TerminalTabSwitching was originally posted as a 32-bit plugin for SIMBL 3 years ago [here](http://ciaranwal.sh/2007/12/10/tab-switching-in-terminal). Since then, Terminal and OSX went 64-bit and the plugin stopped working. dabeeeenster has ported the plugin and you can download the latest version on [github](http://github.com/dabeeeenster/TerminalTabSwitching).

Another useful tweak I do is bind the left and right bracket, `Apple [`, to select the next or previous tab, like in every other program. Terminal defaults to using curly brackets, `Apple {`, to switch tabs, but doesn't let you change that. In the OSX System Preferences, under the Keyboard settings, you can rebind window commands to any key you want and I do so!

<span class="aligncenter">
![Rebind Apple right bracket](/pic/terminal2.png "Rebind Apple ]")
</span>

###Terminal Colors
This is mostly cosmetic, but when in Vim and coding, having the specific color for a function or variable is useful and every color has huge implied meaning. Being able to better select the right color and using more eye pleasing colors is useful.

[TerminalColors](http://blog.fallingsnow.net/2009/08/28/fixing-colors-in-terminal-app-on-10-6/) is a plugin that updates the default colors to be less jarring and lets you use the standard OSX color picker to choose any color you want. Downloadable [here](http://cloud.github.com/downloads/evanphx/terminalcolours/TerminalColours-SL.tar.gz).

**Addendum:**
If you are getting "Terminal version errors" or something equivalent, you may have to modify your plugin to support the latest version of Terminal. Goto `~/Library/Application Support/SIMBL`, right click on the broken plugin and select "Show Package Contents". Then open the Contents folder and open the Info.plist file with a text editor. Generally it is the MaxBundleVersion number that gives problems. Increase that number until it works, I'm using 280 for my bundles and Terminal is at version 273 as of now.

These tweaks help me use Terminal better and make my life easier. If you want more tips on OSX Finder and Terminal integration, check out my other post [here](/2009/01/31/osx-terminal-and-finder-integration/). Hope they help you as well!
