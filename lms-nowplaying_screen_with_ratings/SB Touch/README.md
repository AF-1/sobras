SB Touch - display ratings on *Now Playing* screen
====
tested with Touch firmware version 7.8.0 r16754<br><br>

![screenshot1](../screenshots/touch.jpg)
<br><br>
This manual describes how to display track ratings / rating stars on the Now Playing screen of a **SB Touch** device (that uses the *WQVGAsmall* skin).
<br><br><br>

## Installation

[**Download the modified files from this repository.**](https://github.com/AF-1/sobras/raw/main/lms-nowplaying_screen_with_ratings/NPmodFiles-SBTouch.zip)

**Enable Remote Access** (ssh) on your SB Touch: *Settings* > *Advanced* > *Remote Login* > *Enable SSH*
<br><br>
**Log into** your device (user: root, default password: 1234). You may need to use legacy algorithms and ciphers to log in:<br>
`ssh -o KexAlgorithms=+diffie-hellman-group1-sha1 -c aes256-cbc root@TouchDeviceIP`
<br><br>
**Backup the original applet files** on your device by renaming them:<br>
`mv /usr/share/jive/applets/NowPlaying/NowPlayingApplet.lua /usr/share/jive/applets/NowPlaying/NowPlayingApplet.lua_ORIGINAL`<br><br>
`mv /usr/share/jive/applets/WQVGAsmallSkin/WQVGAsmallSkinApplet.lua /usr/share/jive/applets/WQVGAsmallSkin/WQVGAsmallSkinApplet.lua_ORIGINAL`
<br><br>
**Log out** of your SB Touch with `exit`. **Don't** restart or power off your device!
<br><br>
**Copy the new files** you've downloaded from this repository to your SB Touch:<br>
`scp -o KexAlgorithms=+diffie-hellman-group1-sha1 -c aes256-cbc /path/to/NowPlaying/NowPlayingApplet.lua root@TouchDeviceIP:/usr/share/jive/applets/NowPlaying/`<br><br>
`scp -o KexAlgorithms=+diffie-hellman-group1-sha1 -c aes256-cbc /path/to/WQVGAsmallSkin/WQVGAsmallSkinApplet.lua root@ouchDeviceIP:/usr/share/jive/applets/WQVGAsmallSkin/`<br><br>
`scp -r -o KexAlgorithms=+diffie-hellman-group1-sha1 -c aes256-cbc /path/to/WQVGAsmallSkin/images/NowPlaying/*.png root@TouchDeviceIP:/usr/share/jive/applets/WQVGAsmallSkin/images/`
<br><br>
**Reboot** your SB Touch:<br>
`ssh -o KexAlgorithms=+diffie-hellman-group1-sha1 -c aes256-cbc root@deviceIP reboot`
<br><br>
**Disable SSH** on your device if no longer needed.
<br><br><br><br><br>
**Disclaimer:** Modifying the NowPlaying applet and the WQVGAsmall skin applet works for me. But *I don't take any responsibility* if you mess up your Now Playing screen in the process. If you forgot to back up the original files before modifying them and it didn't work out, you can always reset the firmware (restore factory settings).
