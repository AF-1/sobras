Change font to use the rating star ★ in LMS title formats
====
**(Radio, piCorePlayer, SqueezePlay, Touch, jivelite controllers)**

> [!NOTE]
> The [Dark Flat Skin](https://github.com/AF-1/jivelite-darkflatskin#dark-flat-skin) applet (*piCorePlayer, SqueezePlay, SB Touch*) already includes the required font files.<br>
<br>

The *default font* of players with jivelite as graphical frontend (**piCorePlayer**, **SqueezePlay**, SB **Touch**, SB **Radio**...) **does not include** the [**black star**](https://www.fileformat.info/info/unicode/char/2605/index.htm) (unicode 2605) character ★.<br><br>
So if you want to use the **black star character to display track ratings** with **LMS title formats**, you will have to **use a different font on your player** that **includes the black star character** (unless you already use the [Dark Flat Skin](https://github.com/AF-1/jivelite-darkflatskin#dark-flat-skin) applet on piCorePlayer, SqueezePlay or SB Touch).<br><br>
Fortunately, that's not difficult. You can either use an applet to install the font on your device or copy the new fonts to your device manually using SSH.<br><br>

## Install fonts with FontReplacer applet

Use the **FontReplacer applet** (from the LMS plugin/applet repository) to install an expanded version of the default FreeSans font. *I haven't tested this at all.* It's supposed to be very easy. So I recommend you try this if you don't feel comfortable using SSH.<br><br><br>

## Copy fonts to device using SSH

If you have **SSH access** enabled on your device, [**download** the archive with the font files](https://github.com/AF-1/sobras/raw/main/lms-jivelite-change-font/NewFontFiles.zip) from this repository, extract the font files and use the commands for your device type below. Your device expects the *new* font files to have the same name as the original fonts. The downloadable font files in this repository already have the correct names.<br><br>

### piCorePlayer

*On the **piCorePlayer** device:* **create a folder** for the font files (*if it doesn't exist*).<br>
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

> [!IMPORTANT]:
> If you have problems logging into or copying files to your *SB Radio* or *SB Touch*, please read [**this**](https://github.com/AF-1/sobras/wiki/Command-line-access-to-SB-Radio-and-SB-Touch).

<br>

*On your **device**:* **rename** the **original/old** font files (as a backup).<br>
`mv /usr/share/jive/fonts/FreeSans.ttf /usr/share/jive/fonts/FreeSans.ttf_ORIGINAL`<br>
`mv /usr/share/jive/fonts/FreeSansBold.ttf /usr/share/jive/fonts/FreeSansBold.ttf_ORIGINAL`
<br><br>

**Copy the **new/dowloaded** font files to the font folder of your device:**

- using **SSH/scp** on your **PC** (SB **Touch** & SB **Radio**):<br>
		`scp -o KexAlgorithms=+diffie-hellman-group1-sha1 -c aes256-cbc /path/to/FreeSans.ttf /path/to/FreeSansBold.ttf root@deviceIP:/usr/share/jive/fonts/`<br><br>

- using a **USB Stick** (e.g. formatted as FAT32 / MBR) (SB **Touch**):<br>
        copy the files to the USB Stick, insert it into the SB Touch and copy the files from there:<br>
        `cp /media/sda1/FreeSans.ttf /media/sda1/FreeSansBold.ttf /usr/share/jive/fonts/`<br><br>

*On your device* - set correct permissions for copied font files (optional):<br>
`cd /usr/share/jive/fonts/ && chmod 644 FreeSans.ttf && chmod 644 FreeSansBold.ttf`<br><br>

`reboot`
<br><br><br><br><br>

**Disclaimer**: I don't take any responsibility if you mess up your device in the process. If you forgot to back up the original files before modifying them and it goes wrong, of course, **you can always reset your installation using *restore factory settings***.<br>
