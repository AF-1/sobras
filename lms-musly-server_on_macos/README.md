Install Musly Server on macOS
====

"Musly analyzes the audio signal of music pieces to estimate their similarity" [[1]](https://www.musly.org/). **Musly Server** together with some Python API scripts and a complementary LMS plugin ([Music Similarity](https://github.com/CDrummond/lms-musicsimilarity) or [LMS Musly Integration](https://www.nexus0.net/pub/sw/lmsmusly/)) will find music tracks similar to a specific track or use the LMS plugin *Don't Stop The Music* to create a dynamic playlist with similar tracks in LMS.<br><br>

## Please read first
This guide covers the installation of Musly Server on macOS (10.**15**). I also compiled the musly-0.2 binaries on MacOS 10.15. It may work on other versions of macOS but I haven't tested it.<br>
In this guide I'll use the [Python API scripts](https://github.com/CDrummond/musly-server) and the LMS plugin [Music Similarity](https://github.com/CDrummond/lms-musicsimilarity) of [CDrummond](https://github.com/CDrummond).
Please substitute YOURUSERNAME in the example script etc. with your short username. Use the `whoami` command to display it.
<br><br><br>

## Installation
Musly Server on macOS requires Python**3** and **ffmpeg**.<br>
To keep it simple I will use **Homebrew** to install them.<br>
If you prefer a different way to install them or have them installed already you can skip these steps.

Install **XCode Command Line Tools**:<br>
`xcode-select --install`

Install **Homebrew** (as **admin** user!!):<br>
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

Use Homebrew to install **ffmpeg**:<br>
`brew install ffmpeg`

Unpack [musly-0.2.zip](https://github.com/AF-1/sobras/tree/main/lms-musly-server_on_macos/binaries) (as a folder) into **/usr/local/opt**<br>

Create **Python3 virtual environment** (change the name if you like) and **install the required Python3 modules**:<br>
`python3 -m venv ~/lmsmusly-pyenv`<br>
`source ~/lmsmusly-pyenv/bin/activate`<br>
`pip3 install requests cherrypy flask mutagen`<br>

Create these folders:<br>
`mkdir ~/Music/Musly ~/Music/muslydb`<br>

Get the lastest version of the [Python API scripts](https://github.com/CDrummond/musly-server) and unpack the **musly-server-master folder** into **~/Music/Musly**.<br>

Now **edit the config file**:<br>
`nano ~/Music/Musly/musly-server-master/config.json`<br>

Here's an example of some paths that you'll have to change:
<br>
```
 "libmusly":"/usr/local/opt/musly-0.2/lib/libmusly.dylib",
 "paths":{
  "db":"/Users/YOURUSERNAME/Music/muslydb/",
  "musly":"/Volumes/external HDD/Music/",
  "lms":"/Volumes/external HDD/Music/",
  "tmp":"/tmp/"
 },
 "lmsdb":"/Users/YOURUSERNAME/Library/Caches/Squeezebox/library.db",
```

**"musly"** and **"lms"** point to where your music files are stored.<br><br><br>

## First run & analysis

`cd ~/Music/Musly/musly-server-master/`<br>
`source ~/lmsmusly-pyenv/bin/activate`<br>
`python3 musly-server.py --analyse m`<br>
> **or:** use the debug option **-l DEBUG** to get (many) status messages:<br>
> `python3 musly-server.py --analyse m -l DEBUG`
<br><br>

How long this will take depends on your hardware and on the size of your library.<br>
You could use another mac with more powerful hardware to analyze your library and then copy the results of your analysis (the database file musly.db and musly.jukebox) back to your older mac. But that's not part of this guide.

BTW if the process hangs you can always stop it with **control z** and maybe restart it with the debug option to see what's going on.<br><br><br>



## Running musly-server as a daemon/in the background

On macOS you can simply use **launchd** to run musly-server in the background.<br>

First create a **script** that will start musly-server:<br>

`nano ~/Music/Musly/muslyserverdaemon.sh`
<br><br>
with this content (use your username):<br>

```
#!/bin/sh
cd /Users/YOURUSERNAME/Music/Musly/musly-server-master/
source /Users/YOURUSERNAME/lmsmusly-pyenv/bin/activate
python3 musly-server.py
```

Make it executable:<br>
`chmod 755 ~/Music/Musly/muslyserverdaemon.sh`<br>

Then **create a launchjob** (if the folder *~/Library/LaunchAgents* does not exist create it first):<br>
`nano ~/Library/LaunchAgents/com.me.muslyserverd.plist`<br>

with this content:<br>
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Label</key>
	<string>com.me.muslyserverd</string>
	<key>ProgramArguments</key>
	<array>
		<string>bash</string>
		<string>-c</string>
		<string>/Users/YOURUSERNAME/Music/Musly/muslyserverdaemon.sh</string>
	</array>
    <key>KeepAlive</key>
    <true/>
	<key>StandardOutPath</key>
	<string>/Users/YOURUSERNAME/Library/Logs/muslyserver.log</string>
	<key>StandardErrorPath</key>
	<string>/Users/YOURUSERNAME/Library/Logs/muslyserver.log</string>
</dict>
</plist>
```

Now **start** the **launchjob** (and musly-server as a background process) with:<br>
`launchctl load ~/Library/LaunchAgents/com.me.muslyserverd.plist`<br>

To **stop** it use:<br>
`launchctl unload ~/Library/LaunchAgents/com.me.muslyserverd.plist`<br>

To see if the launchjob is already up and running use:<br>
`launchctl list | grep musly`<br>

It will create a log file at *~/Library/Logs/muslyserver.log* if you want to check for error messages.<br>

That's basically it.
