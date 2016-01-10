---
categories: Life
date: 2009/01/31 13:59:17
tags: ''
title: OSX Terminal And Finder Integration
---

I love the Terminal that comes standard with OSX and now thanks to 10.5, the
Finder has improved a bunch as well. Between the two of them, I can get to the
right directory and get what I want done pretty quick. Here are a bunch of tips
to help integrate and work better with them.

### Finder

* For just navigating around, I use List mode (Apple + 2) exclusively. My hands
  sit on the Apple key and the cursor keys. You can move the current selection
  up and down with the cursor keys. If you want to go up a directory,
  `Apple + cursor Up`. If you have selected a file to open or folder you want to descend
  into, `Apple + cursor Down`. If you want to view the contents of the directory,
  with the directory still selected, hit cursor Right to open up a tree of the
  directory. Hit cursor Left to close the tree. If you see another directory you
  want to explore in the tree of files and folders you just opened, go down to
  it and cursor Right to open another tree. Once you are multiple trees deep,
  tap cursor Left to go up to the top of the immediate tree. Tap cursor left
  again to close it. You can keep double tapping cursor Left to get the top tree
  you first opened.

* I enable showing the full path of the current directory in the Finder title by
  running this in a Terminal, [Thanks to TUAW][1]:

    ```
    defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES
    ```
    
* I have a button to open a new Terminal at the Finder's current location. [All
  credit goes here, where you can download it too][2]. Once you have that
  application downloaded, I place it in my Utilities directory. To drag it onto
  the toolbar, you might have to hold down the Apple button, so that a green
  `+` icon shows up.
  
* To see and quickly go to a parent
  directory of the current directory, hold Apple and click on the top folder
  icon in the title bar. A dropdown appears showing the directories; selecting
  one will open it in a new Finder window.
  
### Terminal

* To open a new Finder window at the current Terminal location, you can run
  "open ." Open is part of the OSX suite to open any application in the
  Application directory. In my .bashrc, I have this aliased as follows:

    ```
    alias of="open ."
    ```

    I have another binding to change the Terminal location to the location of the
    front most Finder window. I can't take credit for this, so thanks to the
    internet for this! As follows in my .bashrc:

    ```
    # OSX: cd's to frontmost window of Finder
    # eg; change finder directory 
    cdf() {
        currFolderPath=$( /usr/bin/osascript << EOT
            tell application "Finder"
                try
                    set currFolder to (folder of the front window as alias)
                on error
                    set currFolder to (path to desktop folder as alias)
                end try
                POSIX path of currFolder
            end tell
    EOT
        )
        echo "cd to \"$currFolderPath\""
        cd "$currFolderPath"
    }
    ```

* For the reverse, you can create an executable bash script called 'fdc', which
  you place in your `~/bin/` directory, assuming your `$PATH` sources `~/bin/`.

    ```
    # OSX: change frontmost Finder window to the cwd
    # eg; finder directory change
    fdc() {
        if [ -n "$1" ]; then
            if [ "${1%%/*}" = "" ]; then
                thePath="$1"
            else
                thePath=`pwd`"$1"
            fi
        else
            thePath=`pwd`
        fi

        /usr/bin/osascript << EOT
            set myPath to ( POSIX file "$thePath" as alias )
            try
                tell application "Finder" to set the (folder of the front window) to myPath
            on error -- no open folder windows
                tell application "Finder" to open myPath
            end try
    EOT
    }
    ```

    You can drag a Finder window's location into a Terminal by using the titlebar
    folder icon again. Prefix with a "cd", then select the folder icon, and drag
    over the Terminal window until the green + icon appears.

Got any other to share? These handful of commands make life alot better!


[1]: http://www.tuaw.com/2008/12/05/terminal-tips-enable-path-view-in-finder/
[2]: http://jo.irisson.free.fr/?p=59
