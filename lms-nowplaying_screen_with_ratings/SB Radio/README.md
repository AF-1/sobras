SB Radio - display ratings on *Now Playing* screen
====
tested with Radio firmware version 7.7.3 r16676<br><br>

![screenshot1](../screenshots/radio1.jpg)<br><br>
![screenshot2](../screenshots/radio2.jpg)
<br><br>
Modifying the NowPlaying applet and some skin applet is not very risky and it works for me. But *I don't take any responsibility* if you mess up your Now Playing screen in the process. If you forgot to back up the original files before modifying them and it goes wrong, of course, you can always reset the firmware (restore factory settings).
<br>
## Read this first please
I've included 2 versions of the file **NowPlayingApplet.lua**: the one that includes the *subscribe* function unfortunately makes the *NowPlaying* **menu item** disappear from the *home menu*. Otherwise it works as expected.<br>The only difference between the two is the subscribe function that allows your Radio to update the rating value without user interaction when the rating value has been changed elsewhere. Eiter way, no big deal.
<br><br>

## Installation

enable Remote Access (ssh) on your SB Radio: Settings > Advanced > Remote Login > Enable SSH
<br><br>
log into your device (user: root, default password: 1234), you may need to use legacy algorithms and ciphers to log in
<br>
`ssh -o KexAlgorithms=+diffie-hellman-group1-sha1 -c aes256-cbc root@deviceIP`
<br><br>
backup original files on device by renaming them
<br>
`mv /usr/share/jive/applets/NowPlaying/NowPlayingApplet.lua /usr/share/jive/applets/NowPlaying/NowPlayingApplet.lua_ORG && mv /usr/share/jive/applets/QVGAlandscapeSkin/QVGAlandscapeSkinApplet.lua /usr/share/jive/applets/QVGAlandscapeSkin/QVGAlandscapeSkinApplet.lua_ORG`
<br><br>
log out of device with `exit`
<br><br>
copy new files to SB Radio (replace *localfilepath* with local path where you stored these files on your computer)
<br>
`scp -o KexAlgorithms=+diffie-hellman-group1-sha1 -c aes256-cbc /localfilepath/NowPlaying/NowPlayingApplet.lua root@deviceIP:/usr/share/jive/applets/NowPlaying/`
<br><br>
`scp -o KexAlgorithms=+diffie-hellman-group1-sha1 -c aes256-cbc /localfilepath/QVGAlandscapeSkin/QVGAlandscapeSkinApplet.lua root@deviceIP:/usr/share/jive/applets/QVGAlandscapeSkin/`
<br><br>
`scp -o KexAlgorithms=+diffie-hellman-group1-sha1 -c aes256-cbc /localfilepath/QVGAlandscapeSkin/images/NowPlaying/*.png root@deviceIP:/usr/share/jive/applets/QVGAlandscapeSkin/images/`
<br><br>
reboot SB Radio
<br>
`ssh -o KexAlgorithms=+diffie-hellman-group1-sha1 -c aes256-cbc root@deviceIP reboot`
<br><br>
disable SSH on your device if no longer needed
