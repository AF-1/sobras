piCorePlayer - display ratings on *Now Playing* screen
====
tested with piCorePlayer v6.1.0<br>
and 7″ touchscreen monitor (Raspberry Pi Foundation)<br><br>

![screenshot1](../screenshots/pcp1.jpg)<br><br>
![screenshot2](../screenshots/pcp2.jpg)
<br>
# Installation

### remote access (ssh)
on piCorePlayer *remote access* (ssh) should be enabled by default<br>
if ssh is disabled, here's how to enable it:<br>
- in your browser open the pcp-webadmin page: `http://IPaddressofyourpiCorePlayer` (add port if not default)<br>
- go to **Main Page**, at the bottom click on **Beta**, then click on *Beta* > *Security*<br>
- in tab *Disable SSH* click on **Enable SSH**
<br><br>

### copy files
piCorePlayer mounts jivelite as a *read-only* extension and overwrites all changes after reboot.<br>
**Workaround**: a script that deletes the links to the default applets *NowPlaying* and *JogglerSkin* after every reboot so that the customized versions of them will be used instead.
<br><br>
log into your piCorePlayer (default user: tc, default password: piCore)
<br>
`ssh tc@deviceIP`
<br><br>
copy default version of applets *NowPlaying* and *JogglerSkin* to user applet folder<br>
`sudo cp -r /opt/jivelite/share/jive/applets/NowPlaying/ ~/.jivelite/userpath/applets/ && sudo cp -r /opt/jivelite/share/jive/applets/JogglerSkin/ ~/.jivelite/userpath/applets/`
<br><br>
remove applet files in copied applet folders<br>
`sudo rm ~/.jivelite/userpath/applets/NowPlaying/NowPlayingApplet.lua && sudo rm ~/.jivelite/userpath/applets/JogglerSkin/JogglerSkinApplet.lua`
<br><br>
create script *pcpOnBootChanges* to delete default version of these applets after every reboot<br>
`cd ~/ && echo "sudo rm -rf /opt/jivelite/share/jive/applets/NowPlaying/ && sudo rm -rf /opt/jivelite/share/jive/applets/JogglerSkin/" > pcpOnBootChanges.sh && chmod 755 pcpOnBootChanges.sh`
<br><br>
run script after boot<br>
`sudo echo "/home/tc/pcpOnBootChanges.sh 2>&1" >> /opt/bootlocal.sh`
<br><br>
log out of piCorePlayer with `exit` but **don't** reboot or power off piCorePlayer
<br><br>
copy new files to piCorePlayer (replace *localfilepath* with local path where you stored these files on your computer)<br>
`scp /localfilepath/NowPlaying/NowPlayingApplet.lua tc@deviceIP:/home/tc/`<br>
`scp /localfilepath/JogglerSkin/JogglerSkinApplet.lua tc@deviceIP:/home/tc`<br>
`scp /localfilepath/JogglerSkin/images/NowPlaying/*.png tc@deviceIP:/home/tc`
<br><br>
log into your piCorePlayer
<br>
`ssh tc@deviceIP`
<br><br>
move new files into correct folders<br>
`sudo mv NowPlayingApplet.lua ~/.jivelite/userpath/applets/NowPlaying/ && sudo mv JogglerSkinApplet.lua ~/.jivelite/userpath/applets/JogglerSkin/ && sudo mv *.png ~/.jivelite/userpath/applets/JogglerSkin/images/NowPlaying/`
<br><br>
**important**: now backup all changes so they will survive a reboot<br>
`sudo filetool.sh -b`<br><br>
now reboot your piCorePlayer with `sudo reboot`
