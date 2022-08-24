piCorePlayer - display ratings on *Now Playing* screen
====
tested with piCorePlayer v8.1.0<br>
and 7″ touchscreen monitor (Raspberry Pi Foundation)<br><br>

![screenshot1](../screenshots/pcp1.jpg)<br><br>
![screenshot2](../screenshots/pcp2.jpg)
<br><br>
This manual describes how to display track ratings / rating stars on the Now Playing screen of a **piCorePlayer** (that uses the *Joggler* skin).<br><br>


# Installation

**Recommended**: create a complete backup of your piCorePlayer SD card. Makes restoring quick and easy if something goes wrong.

### Remote access (ssh)
On piCorePlayer *remote access* (ssh) should be enabled by default.<br>
If ssh is disabled here's how to enable it:<br>
- in your browser open the pCP-webadmin page: `http://IPaddressofyourpiCorePlayer` (add port if not default port 80).<br>
- Go to **Main Page**, at the bottom click on **Beta**, then click on *Beta* > *Security*.<br>
- In the tab *Disable SSH* click on **Enable SSH**.
<br><br>

### Copy files
piCorePlayer mounts jivelite as a *read-only* extension and overwrites all changes after reboot.<br>
We'll use a simple script that deletes the *links* to the default applets *NowPlaying* and *JogglerSkin* after every reboot so that pCP will use the modified versions you've downloaded from this repository instead.
<br><br>
**Log into** your piCorePlayer (default user: tc, default password: piCore)
<br>
`ssh tc@pCPdeviceIP`
<br><br>
**Copy** the default applets *NowPlaying* and *JogglerSkin* to the *user* applet folder:<br>
`sudo cp -r /opt/jivelite/share/jive/applets/NowPlaying/ ~/.jivelite/userpath/applets/ && sudo cp -r /opt/jivelite/share/jive/applets/JogglerSkin/ ~/.jivelite/userpath/applets/`
<br><br>
**Remove** those files that we're going to replace with our modified versions:<br>
`sudo rm ~/.jivelite/userpath/applets/NowPlaying/NowPlayingApplet.lua && sudo rm ~/.jivelite/userpath/applets/JogglerSkin/JogglerSkinApplet.lua`
<br><br>
**Create a script** called *pcpOnBootChanges* to delete the links to the default applet versions after every reboot:<br>
`cd ~/ && echo "sudo rm -rf /opt/jivelite/share/jive/applets/NowPlaying/ && sudo rm -rf /opt/jivelite/share/jive/applets/JogglerSkin/" > pcpOnBootChanges.sh && chmod 755 pcpOnBootChanges.sh`
<br><br>
Let's **run the script after (every) boot**:<br>
`sudo echo "/home/tc/pcpOnBootChanges.sh 2>&1" >> /opt/bootlocal.sh`
<br><br>
**Log out** of piCorePlayer with `exit` but **don't reboot or power off piCorePlayer!!**
<br><br>
**Copy the new files** you've downloaded from this repository to your piCorePlayer:<br>
`scp /path/to/NowPlaying/NowPlayingApplet.lua tc@pCPdeviceIP:/home/tc/`<br>
`scp /path/to/JogglerSkin/JogglerSkinApplet.lua tc@pCPdeviceIP:/home/tc`<br>
`scp /path/to/JogglerSkin/images/NowPlaying/*.png tc@pCPdeviceIP:/home/tc`
<br><br>
**Log into** your piCorePlayer:<br>
`ssh tc@pCPdeviceIP`
<br><br>
**Move the new files** to the user applet folders:<br>
`sudo mv NowPlayingApplet.lua ~/.jivelite/userpath/applets/NowPlaying/ && sudo mv JogglerSkinApplet.lua ~/.jivelite/userpath/applets/JogglerSkin/ && sudo mv *.png ~/.jivelite/userpath/applets/JogglerSkin/images/NowPlaying/`
<br><br>
**Important**: now **backup** all changes so they will survive a reboot:<br>
`sudo filetool.sh -b`<br><br>
Now **reboot** your piCorePlayer with `sudo reboot`
<br><br><br><br><br>
**Disclaimer:** Modifying the NowPlaying applet and the Joggler skin applet works for me. But *I don't take any responsibility* if you mess up your Now Playing screen in the process. If you forgot to back up the original files before modifying them and it didn't work out, you can always restore from a backup of your piCorePlayer SD card.
