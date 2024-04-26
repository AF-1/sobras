LMS on my mac
====
My (headless) Mac mini runs the latest macOS 10.15. So I don't know if anything I'll describe below works with later OS versions or on M1 machines but I guess that some or most of it will.
<br><br><br>


# LMS auto-start

If the default method to start LMS works fine for you, skip this. There's more than one way to start LMS on a Mac. Here's mine:<br>
I have **auto-login enabled** so that when I start my mac it will boot directly into the user account that runs LMS.<br>
And I suppose that you've already granted one or more perl binaries (/usr/bin/perl, /usr/bin/perl5.18, /usr/bin/perl5.28 or the one that's installed by the LMS package) **Full Disk Access** (*System Preferences* > *Security & Privacy* > *Full Disk Access*).

Log in to the user account that runs LMS.

Open **System Preferences** > **LMS** > **Status** and set the *auto-start preference* to **Never start server automatically**.

Now **create a launch agent** that will start LMS automatically when you're booting into this user account.

Make sure that the folder `~/Library/LaunchAgents/` exists. Otherwise create it.

Use a text editor of your choice (e.g. [BBEdit](
https://www.barebones.com/products/bbedit/
)) to **create a plain text file** called **Squeezebox.plist** with this content:

````
<plist version="1.0">
	<dict>
		<key>Label</key>
		<string>Squeezebox</string>
		<key>RunAtLoad</key>
		<true />
		<key>Program</key>
			<string>/Library/PreferencePanes/Squeezebox.prefPane/Contents/server/slimserver.pl</string>
		<key>WorkingDirectory</key>
		<string>/Library/PreferencePanes/Squeezebox.prefPane/Contents/server</string>
		<key>StandardOutPath</key>
		<string>/Users/YOURUSERNAME/Library/Logs/Squeezebox/server.log</string>
		<key>StandardErrorPath</key>
		<string>/Users/YOURUSERNAME/Library/Logs/Squeezebox/server.log</string>
	</dict>
</plist>
````

Replace YOURUSERNAME with your **user account name**. You can use the `whoami` command to display it.
Then save **Squeezebox.plist** to `~/Library/LaunchAgents/`.

That's basically it. Now LMS should start automatically after every reboot - but probably a bit later in the boot process. That's not a bad thing if your music files are stored on an external volume because sometimes macOS takes a moment before mounting those.
<br><br><br>

## Suggestion: create 1-click apps to stop/restart LMS from the Dock

Use Apple's **Script Editor** (from */Applications/Utilities/*) to create two very simple LMS scripts that will restart / stop LMS and save them as apps.<br><br>

### LMS Restart
Paste these lines below, then **save** the script as an **application** and name it **LMS restart**, for example:

````
do shell script "sh '/Library/PreferencePanes/Squeezebox.prefPane/Contents/Resources/stop-server.sh'"
delay 3
do shell script "sh '/Library/PreferencePanes/Squeezebox.prefPane/Contents/Resources/start-server.sh'"
````
<br>

### LMS Stop
Paste the line below, then **save** the script as an **application** and name it **LMS stop**, for example:

```
do shell script "sh '/Library/PreferencePanes/Squeezebox.prefPane/Contents/Resources/stop-server.sh'"
```

Now drag/add these applications to the Dock.
<br><br><br><br>


# Put your mac to sleep

## Narcolepsy

If you're using a dedicated, maybe older and headless mac to host LMS you may want your Mac to go to sleep when you're not using LMS. Here's how I do it:

First, disable all OS sleep settings. In **System Preferences** > **Energy Saver** and set **Display sleep** and **Computer sleep** to **Never**. And make sure that **Wake for Ethernet network access** is ticked.

Then download the [**Narcolepsy Applescript script**](https://github.com/AF-1/sobras/tree/main/lms-on-macos/resources)_*_ that will handle everything necessary to put your mac to sleep.

Open it in Apple's **Script Editor** (from */Applications/Utilities/*) and fill in the correct values for LMS username and LMS password. If you don't use a username and password with LMS just remove this part from the curl commands:<br>
`--user '" & LMSusername & ":" & LMSuserPW & "'`

**Save the script as an application**(!) to a folder of your choice and double-click it. It'll probably ask you for some permissions it needs to access folders and such. It is important you do this. WIthout the proper permissions granted Narcolepsy won't be able to put your mac to sleep.<br>
Confirm it's running: open **Activity Monitor** and search for a process called *Narcolepsy*<br><br>

If you want it to **start automatically after every OS reboot**: open **System Preferences** > **Users & Groups**, select your user account (the one that runs LMS), select the **Login Items** tab on the right and add the **Narcolepsy.app**. <br>

That should be it.<br><br>

### Editing the script
You can edit the script, of course: change time values, add more conditions or apps Narcolepsy should monitor. If Narcolepsy doesn't put your mac to sleep try setting **debug output** to **true** for more detailed information.<br><br>

### Notes
* *Narcolepsy* will not put your mac to sleep if **any** of your players is still active/switched on.
* If you edit the script and save it as an application, you have to start the app afterwards so macOS can ask you for the required permissions. Unfortunately, every edit seems to require a regranting of permissions.
<br><br>

_*_ based on the 2012 script by Kynan Shook & Torben Schreiter
<br><br><br><br>

## Disabling dark wake

Your mac might wake unexpectedly. There are a number of [*possible reasons*](https://support.apple.com/en-gb/guide/mac-help/mchlp2995/mac) for this. If it wakes regularly (every 2 hours) it might be connected to [**DarkWake**](https://www.insanelymac.com/forum/topic/342002-darkwake-on-macos-catalina-boot-args-darkwake8-darkwake10-are-obsolete/), a kind of "partial wake where only certain parts of your hardware are lit up for maintenance tasks while others remain asleep".<br>
If you don't want/need darkwake you can try to disable it. The way to do this has changed a couple of times over the years and there's no guarantee that this will continue to work in the future. Below you'll find what works on macOS 10.15.<br><br>
You'll have to add `darkwake=0` to the NVRAM boot-args:<br>

`sudo nvram boot-args="darkwake=0"`<br>

Confirm it's listed with:<br>

`nvram -p | grep darkwake`<br>

Reboot your Mac.
<br><br><br><br>


## App to wake your LMS Mac

Most LMS players will send a 'magic packet' (Wake-on-LAN / WOL) to wake your LMS Mac or, if not enabled by default, have a setting where you can enable auto-waking the server.

But if you disable *dark wake* there may be times when you'll have to wake your LMS Mac yourself, i.e. manually use a WOL command / send a 'magic packet' to wake your server.

It happens, for example, when I'm using the web UI (*LMS default skin* or *Material*) on another machine. With dark wake disabled entering the LMS server IP into the browser url bar will **not** wake the server.

I use a tiny AppleScript app with a Mac wake-on-lan binary to wake my LMS Mac.<br>
[**Download the app**](https://github.com/AF-1/sobras/tree/main/lms-on-macos/resources) and open it in Apple's **Script Editor** (from */Applications/Utilities/*) to **change the values for server IP and server MAC address**. You can find both values on the *LMS settings* > *Information* page. Since it doesn't have a developer ID you may have to remove the quarantine flag of that app before starting it:

`sudo xattr -r -d com.apple.quarantine path/to/WakeMac.app`

One click to start the WakeMac app and the server should wake up.