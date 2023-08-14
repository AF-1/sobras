Change font on piCorePlayer, Touch, Radio (jivelite)
====

The *default font* of players with jivelite as graphical frontend (**piCorePlayer**,SB **Touch**, SB **Radio**, **SqueezePlay**...) is **Free Sans** which **does not include** the [**black star**](https://www.fileformat.info/info/unicode/char/2605/index.htm) (unicode 2605) character ★.<br><br>
So if you want to use the **black star character to display track ratings** (e.g. in title formats), you will have to **use a different font on your player** that **includes the black star character**.<br><br>
Fortunately, that's not difficult. You can either use an applet to install the font on your device or copy the new fonts to your device manually using SSH.<br><br>

## Install fonts with FontReplacer applet

Use the **FontReplacer applet** (from the LMS plugin/applet repository) to install an expanded version of the default FreeSans font. *I haven't tested this at all.* It's supposed to be very easy. So I recommend you try this if you don't feel comfortable using SSH.<br><br><br>

## Copy fonts to device using SSH

If you have **SSH access**(*) enabled on your device, [**download** the archive with the font files](https://github.com/AF-1/sobras/raw/main/lms-jivelite-change-font/NewFontFiles.zip) from this repository, extract the font files and use the commands for your device type below. Your device expects the *new* font files to have the same name as the original fonts. The downloadable font files in this repository already have the correct names.<br><br>

### piCorePlayer

*On the **piCorePlayer** device:* **create a folder** for the font files (if it doesn't exist).<br>
`mkdir ~/.jivelite/userpath/fonts`
<br><br>

*On your **PC**:* **copy** the new font files to this new folder.<br>
`scp /path/to/FreeSans.ttf tc@IPaddressofpiCorePlayer:/home/tc/.jivelite/userpath/fonts/`<br>
`scp /path/to/FreeSansBold.ttf tc@IPaddressofpiCorePlayer:/home/tc/.jivelite/userpath/fonts/`
<br><br>

*On your **piCorePlayer** device:* **backup** your changes with<br>
`sudo filetool.sh -b`
<br><br>
Reboot.
<br><br><br>


### SB Touch, SB Radio

**Please note: I haven't tested this with the new 8.x firmware on SB Radio/Touch. But I don't expect a simple file replacement to cause any problems.**

*On your **device**:* **rename** the **original/old** font files (as a backup).<br>
`mv /usr/share/jive/fonts/FreeSans.ttf /usr/share/jive/fonts/FreeSans.ttf_ORIGINAL`<br>
`mv /usr/share/jive/fonts/FreeSansBold.ttf /usr/share/jive/fonts/FreeSansBold.ttf_ORIGINAL`
<br><br>

*On your **PC**:* copy the **new/dowloaded** font files to the font folder of your device.<br>

- **SB Touch & SB Radio:** `scp /path/to/FreeSans.ttf /path/to/FreeSansBold.ttf root@deviceIP:/usr/share/jive/fonts/`<br><br>

- On the **SB Touch**, there's **alternative**: use a USB Stick (e.g. formatted as FAT32 / MBR) and copy the file to it. Insert it into the SB Touch and copy the files from there:<br>
`cp /media/sda1/FreeSans.ttf /media/sda1/FreeSansBold.ttf /usr/share/jive/fonts/`<br><br>
Set correct permissions (optional):<br>
`cd /usr/share/jive/fonts/ && chmod 644 FreeSans.ttf && chmod 644 FreeSansBold.ttf`<br><br>


`reboot`
<br><br><br><br><br>

**Disclaimer**: I don't take any responsibility if you mess up your device in the process. If you forgot to back up the original files before modifying them and it goes wrong, of course, **you can always reset your installation using *restore factory settings***.<br>

**(*)** If you need information on how to enable SSH access on your device take a look at the first steps of [this manual](https://github.com/AF-1/sobras/tree/main/lms-nowplaying_screen_with_ratings/).

