Install Music Similarity Server on macOS
====

Maybe try [**Bliss Mixer**](https://github.com/CDrummond/lms-blissmixer) instead.<br>

**Music Similarity** is a "python3 script to analyse your music collection with Bliss, Essentia, and Musly, and to provide a simple HTTP API allowing the creation of mix of similar music for LMS.."<br>

[**Music Similarity Server**](https://github.com/CDrummond/music-similarity) together with the LMS companion plugin ([Music Similarity](https://github.com/CDrummond/lms-musicsimilarity)) will find music tracks similar to a specific track or use the LMS plugin *Don't Stop The Music* to create a continuous mix of similar tracks in LMS.<br><br>

## Please read first
This guide covers the installation of *Music Similarity Server* on macOS (10.**15**). I've compiled the necessary binaries on macOS 10.15. It may work with other versions of macOS but I haven't tested it.<br>
Please replace YOURUSERNAME in the example scripts etc. with your short username. Use the `whoami` command to display it.
<br><br><br>

## Basics
Music Similarity Server and/or the binaries require that you have certain packages/dependencies installed. To keep it simple I will use **Homebrew** to install them.<br>
If you prefer a different way to install them or have them installed already you can skip these steps.

You need XCode's **Command Line Tools** to install *Homebrew* and other packages/dependencies:<br>
`xcode-select --install`

Install **Homebrew** (as **admin** user):<br>
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

Make sure *Homebrew* is up-to-date:<br>
`brew update`<br>
and if necessary: `brew upgrade`.<br>

If you don't have **Python3** installed, use Homebrew to install it:<br>
`brew install python3`
<br><br><br>

## Music Similarity Server

Create these folders:<br>
`mkdir ~/Music/MusicSimilarityServer ~/Music/musicsimilaritydb`<br>

Get the lastest version of the [*Music Similarity Server*](https://github.com/CDrummond/music-similarity) and unpack the **music-similarity-master folder** into `~/Music/MusicSimilarityServer`.<br>

Confirm that the folder `~/Music/MusicSimilarityServer/music-similarity-master/mac/i386` contains the necessary binaries for the analysers you want to use (Bliss, Musly, and/or Essentia). If not, download them from this repo, extract and copy them to that folder.

No matter which analysers you're going to install make sure you **remove Apple's
quarantine flag** from the binary files:<br>
`cd ~/Music/MusicSimilarityServer/music-similarity-master/mac/i386`<br>
`sudo xattr -r -d com.apple.quarantine libmusly.dylib`<br>
`sudo xattr -r -d com.apple.quarantine streaming_extractor_music`<br>
`sudo xattr -r -d com.apple.quarantine bliss-analyse`
<br><br><br>


## Musly

Use Homebrew to install **ffmpeg**:<br>
`brew install ffmpeg`

Create a **Python3 virtual environment** (change the name if you like) and activate it:<br>
`python3 -m venv ~/lmssimilarity-pyenv`<br>
`source ~/lmssimilarity-pyenv/bin/activate`<br>

Change into the *Music Similarity Server* folder and **install the required Python3 modules** using the *requirements.txt* file:<br>
`cd ~/Music/MusicSimilarityServer/music-similarity-master`<br>
`pip3 install -r requirements.txt`<br>

And one last module required on Macs:<br>
`pip3 install cherrypy`
<br><br><br>


## Bliss

Place the `bliss-analyse` binary (from this repo) in the`~/Music/MusicSimilarityServer/music-similarity-master/mac/` folder.

Install an alternate ffmpeg version (may take some time):<br>
`brew install ffmpeg@4`

*ffmpeg@4* is "not symlinked into /usr/local because this is an alternate version of another formula", i.e. you already have another version of ffmpeg installed.

Have Homebrew link it:<br>
`brew link ffmpeg@4`
<br><br><br>


## Essentia

Place the *streaming_extractor_music* binary place in `~/Music/MusicSimilarityServer/music-similarity-master/mac/` folder.<br>Put the contents of the `models-beta5` folder (from this repo) into the `~/Music/MusicSimilarityServer/music-similarity-master/essentia/models` folder (create folder if necessary).
<br><br><br>


## Config file

Now **edit the config file**:<br>
`nano ~/Music/MusicSimilarityServer/music-similarity-master/config.json`<br>

Please have a look at the latest version of the [**MusicSimilarity configuration template**](https://github.com/CDrummond/music-similarity/blob/master/docs/OtherConfig.md) to make sure that the configuration contains all the required parameters.


Here's an example of some paths that you'll have to change:
<br>
```
 "paths":{
  "db":"/Users/YOURUSERNAME/Music/musicsimilaritydb/",
  "local":"/Volumes/external HDD/Music/",
  "lms":"/Volumes/external HDD/Music/",
  "tmp":"/tmp/"
 },
 "lmsdb":"/Users/YOURUSERNAME/Library/Caches/Squeezebox/library.db",
```

**"local"** and **"lms"** point to where your music files are stored.<br>

<br><br><br>



# First run & analysis

`cd ~/Music/MusicSimilarityServer/music-similarity-master/`<br>
`source ~/lmssimilarity-pyenv/bin/activate`<br>
`python3 music-similarity.py --analyse m`<br>
> **or:** use the debug option **-l DEBUG** to get (many) status messages:<br>
> `python3 music-similarity.py --analyse m -l DEBUG`
<br><br>

How long this will take depends on your hardware and on the size of your library.<br>
You could use another mac with more powerful hardware to analyze your library and then copy the results of your analysis (the database file musicsimilarity.db and musicsimilarity.jukebox) back to your older mac. But that's not part of this guide.

BTW if the process hangs you can always stop it with **control c** and maybe restart it with the debug option to see what's going on.<br>

*Optional*: once the analysis is completed you could use this command to test the jukebox and in case of errors have it recreated automatically until there are no more errors:<br>
`python3 music-similarity.py --log-level INFO --test --repeat`
<br><br><br>

# Running music-similarity-server as a daemon/in the background

On macOS you can simply use **launchd** to run music-similarity-server in the background.<br>

First create a **script** that will start music-similarity-server:<br>

`nano ~/Music/MusicSimilarityServer/musicsimilarityserverdaemon.sh`
<br><br>
with this content (use your username):<br>

```
#!/bin/sh
cd /Users/YOURUSERNAME/Music/MusicSimilarityServer/music-similarity-master/
source /Users/YOURUSERNAME/lmssimilarity-pyenv/bin/activate
python3 music-similarity-server.py
```

Make it executable:<br>
`chmod 755 ~/Music/MusicSimilarityServer/musicsimilarityserverdaemon.sh`<br>

Then **create a launchjob** (if the folder *~/Library/LaunchAgents* does not exist create it first):<br>
`nano ~/Library/LaunchAgents/com.me.musicsimilarityserverd.plist`<br>

with this content:<br>
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Label</key>
	<string>com.me.musicsimilarityserverd</string>
	<key>ProgramArguments</key>
	<array>
		<string>bash</string>
		<string>-c</string>
		<string>/Users/YOURUSERNAME/Music/MusicSimilarityServer/musicsimilarityserverdaemon.sh</string>
	</array>
    <key>KeepAlive</key>
    <true/>
	<key>StandardOutPath</key>
	<string>/Users/YOURUSERNAME/Library/Logs/musicsimilarityserver.log</string>
	<key>StandardErrorPath</key>
	<string>/Users/YOURUSERNAME/Library/Logs/musicsimilarityserver.log</string>
</dict>
</plist>
```

Now **start** the **launchjob** (and musicsimilarity-server as a background process) with:<br>
`launchctl load ~/Library/LaunchAgents/com.me.musicsimilarityserverd.plist`<br>

To **stop** it use:<br>
`launchctl unload ~/Library/LaunchAgents/com.me.musicsimilarityserverd.plist`<br>

To see if the launchjob is already up and running use:<br>
`launchctl list | grep musicsimilarity`<br>

It will create a log file at *~/Library/Logs/musicsimilarityserver.log* if you want to check for error messages.<br>

That's basically it.
