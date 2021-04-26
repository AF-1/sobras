Change font on piCorePlayer, Touch, Radio (jivelite)
====

Changing the default font is not very risky and it works for me. But *I don't take any responsibility* if you mess up your device in the process. If you forgot to back up the original files before modifying them and it goes wrong, of course, you can always reset the firmware (restore factory settings).
<br><br>
The *default font* of players with jivelite as graphical frontend (**piCorePlayer**,SB **Touch**, SB **Radio**, **SqueezePlay**...) is **Free Sans** which **does not include** the [**black star**](https://www.fileformat.info/info/unicode/char/2605/index.htm) (unicode 2605) character ★.<br><br>
So if you want to use the **black star character to display track ratings** you will have to **replace the default font** on those devices with a font (ttf format) that includes the black star character.

[Here](https://www.fileformat.info/info/unicode/char/2605/fontsupport.htm) is a non-exhaustive list of fonts that include the black star character.

The **FontReplacer applet** installs an expanded version of the default FreeSans font. If this font is too large for your device or the strain on memory resources is too great try a smaller one like the **DejaVu Sans Condensed** font (ttf, **regular** and **bold**). The example commands below use the DejaVu Sans Condensed font.

If you need information on how to get SSH access to your device and copy files to your device, take a look at the first steps of [this manual](https://github.com/AF-1/sobras/tree/main/lms-nowplaying_screen_with_ratings/).
<br><br>

## SB Touch, SB Radio

*On your device* - **rename the original font files** (as a backup):<br>
`mv /usr/share/jive/fonts/FreeSans.ttf /usr/share/jive/fonts/FreeSans.ttf_ORG`<br>
`mv /usr/share/jive/fonts/FreeSansBold.ttf /usr/share/jive/fonts/FreeSansBold.ttf_ORG`
<br><br>

*On your PC* - copy the new font files to the font folder of your device:<br>
`scp /localfilepath/DejaVuSansCondensed.ttf /localfilepath/DejaVuSansCondensed-Bold.ttf root@deviceIP:/usr/share/jive/fonts/`
<br><br>

*On your device* - **rename the new font files** to match the original file names:<br>
`mv /usr/share/jive/fonts/DejaVuSansCondensed.ttf /usr/share/jive/fonts/FreeSans.ttf`<br>
`mv /usr/share/jive/fonts/DejaVuSansCondensed-Bold.ttf /usr/share/jive/fonts/FreeSansBold.ttf`
<br>

Reboot.
<br><br>

## piCorePlayer

### the easy way

*On piCorePlayer* - **create a folder** for the font files (if it doesn't exist):<br>
`mkdir ~/.jivelite/userpath/fonts`
<br><br>

*On your PC* - **copy** the new font files to this new folder:<br>
`scp /localfilepath/DejaVuSansCondensed.ttf tc@deviceIP:/home/tc/.jivelite/userpath/fonts/FreeSans.ttf`<br>
`scp /localfilepath/DejaVuSansCondensed-Bold.ttf tc@deviceIP:/home/tc/.jivelite/userpath/fonts/FreeSansBold.ttf`
<br><br>

*On piCorePlayer* - **backup** your changes with:<br>
`sudo filetool.sh -b`
<br><br>
Reboot.
<br><br><br>


### another way

piCorePlayer recreates the symlinks to the original fonts after every reboot.<br>
Therefore we have to copy the new font files to a folder that belongs to picCorePlayer's default user *tc* and use a script that is executed after every reboot to replace the *original* symlinks with symlinks that point to the *new* font files.

*On piCorePlayer* - **create a folder** for the font files and the script:<br>
`mkdir ~/ChangeOnBoot`
<br><br>

*On your PC* - **copy** the new font files to this new folder:<br>
`scp /localfilepath/DejaVuSansCondensed.ttf /localfilepath/DejaVuSansCondensed-Bold.ttf tc@deviceIP:/home/tc/ChangeOnBoot/`
<br><br>

*On piCorePlayer* - **create a script** that will replace old symlinks to fonts with new symlinks:<br>
`nano ~/ChangeOnBoot/replacefonts.sh`
<br><br>
with this content:<br>

```sh
#!/bin/sh

# replace default font
cd /opt/jivelite/share/jive/fonts/
sudo rm FreeSans.ttf
sudo rm FreeSansBold.ttf

# DejaVu
sudo ln -s /home/tc/ChangeOnBoot/DejaVuSansCondensed.ttf FreeSans.ttf
sudo ln -s /home/tc/ChangeOnBoot/DejaVuSansCondensed-Bold.ttf FreeSansBold.ttf
```
<br>

make the script **executable**:<br>
`chmod +x ~/ChangeOnBoot/replacefonts.sh`
<br>

tell piCorePlayer to **execute the script on boot**:<br>
`nano /opt/bootlocal.sh`
<br>

at the beginning, line 6, insert this line:<br>
`/home/tc/ChangeOnBoot/replaceFont.sh 2>&1`
<br><br>
Don't forget to **backup** your changes with:<br>
`sudo filetool.sh -b`
<br><br>
Reboot.
<br><br>

## Note

If you're using the **DejaVu Sans Condensed font** and **scrolling of long track titles**, artist and album names on the Now Playing screen shows some *lazy pixels* (lagging behind) just **adjust the line height** like I did [**here**](https://github.com/AF-1/sobras/commit/5c31712a0caad5cbfd1b409b188bef0c72119df0#diff-cc8446c70800fb65858a432d058a8133b80c1f10db8a5b1d6b07880fcd5f2321).