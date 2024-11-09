How to put your mac to sleep
====

How I make sure that my mac[^1] goes to sleep when I don't use LMS.

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

<br><br>
[^1]:My (headless) Mac mini runs the latest macOS 10.15. So I don't know how much of this works with later OS versions or on Silicion macs but I guess that some or most of it will.
