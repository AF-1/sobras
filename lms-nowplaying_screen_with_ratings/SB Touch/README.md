SB Touch - display ratings on *Now Playing* screen
====
tested with Touch firmware version 7.8.0 r16754<br><br>

![screenshot1](../screenshots/touch.jpg)
<br>
## Installation

enable *remote access* (ssh) on your SB Touch: Settings > Advanced > Remote Login > Enable SSH
<br><br>
log into your device (user: root, default password: 1234), you may need to use legacy algorithms and ciphers to log in
<br>
`ssh -o KexAlgorithms=+diffie-hellman-group1-sha1 -c aes256-cbc root@deviceIP`
<br><br>
backup original files on device by renaming them
<br>
`mv /usr/share/jive/applets/NowPlaying/NowPlayingApplet.lua /usr/share/jive/applets/NowPlaying/NowPlayingApplet.lua_ORG && mv /usr/share/jive/applets/WQVGAsmallSkin/WQVGAsmallSkinApplet.lua /usr/share/jive/applets/WQVGAsmallSkin/WQVGAsmallSkinApplet.lua_ORG`
<br><br>
log out of device with `exit`
<br><br>
copy new files to SB Touch (replace *localfilepath* with local path where you stored these files on your computer)
<br>
`scp -o KexAlgorithms=+diffie-hellman-group1-sha1 -c aes256-cbc /localfilepath/NowPlaying/NowPlayingApplet.lua root@deviceIP:/usr/share/jive/applets/NowPlaying/`
<br><br>
`scp -o KexAlgorithms=+diffie-hellman-group1-sha1 -c aes256-cbc /localfilepath/WQVGAsmallSkin/WQVGAsmallSkinApplet.lua root@deviceIP:/usr/share/jive/applets/WQVGAsmallSkin/`
<br><br>
`scp -r -o KexAlgorithms=+diffie-hellman-group1-sha1 -c aes256-cbc /localfilepath/WQVGAsmallSkin/images/NowPlaying/*.png root@deviceIP:/usr/share/jive/applets/WQVGAsmallSkin/images/`
<br><br>
reboot SB Touch
<br>
`ssh -o KexAlgorithms=+diffie-hellman-group1-sha1 -c aes256-cbc root@deviceIP reboot`
<br><br>
disable SSH on your device if no longer needed