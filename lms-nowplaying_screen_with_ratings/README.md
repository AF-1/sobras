Display ratings on *Now Playing* screen (Touch, piCorePlayer, Radio)
====

This is a mod of the **Now Playing** screen that enables the **display of ratings** (pulled directly from the LMS) on *these devices*:

## **SB Touch**
![screenshot1](screenshots/touch.jpg)<br><br><br>

## **piCorePlayer** & **SqueezePlay**
![screenshot1](screenshots/pcp1.jpg)<br><br>
![screenshot2](screenshots/pcp2.jpg)<br><br>
![screenshot3](screenshots/pcp3.jpg)<br><br>

## **SB Radio**
![screenshot1](screenshots/radio1.jpg)<br><br>
![screenshot2](screenshots/radio2.jpg)<br><br><br>

<br>

Each subfolder contains the modified files for the *NowPlaying* applet, one *skin* applet (usually the default one), and the rating star images. Plus some basic installation instructions.
<br>

If you use the [**Ratings Light**](https://github.com/AF-1/lms-ratingslight) plugin to **set track ratings** and you change the rating value of the currently playing track anywhere else (another player, web UI), the **displayed rating** on your NowPlaying screen **will only take a moment to update**.
<br><br>
You can **define a keyword** in the *NowPlayingApplet.lua* (line 127 or 128). If the current track's **comments tag** contains this keyword the **track title gets a slight glow** (see radio screenshot #2).