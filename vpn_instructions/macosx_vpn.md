# Connect an Apple Mac OS X system to your Bubble VPN

## Download the vpn.conf file
  * Login to your Bubble
  * Navigate to the Devices screen
  * Find your device in the device list, or [add your Mac system as a device](../device_setup/add_device.md)
  * Click or tap "Show VPN connection info" for your new Mac device. Click the button that reads "Download vpn.conf file"
  * The `vpn.conf` file may simply download automatically, or you may be asked if you want to Open or Save the file. If you are asked to Open or Save, choose Save to save the `vpn.conf` file to your computer.

## Install WireGuard
  * Download and install WireGuard from the [Mac App Store](https://itunes.apple.com/us/app/wireguard/id1451685025?ls=1&mt=12)
  * If the above link did not work:
    * Open the App Store app on your Mac
    * Search for "wireguard"
    * You should see a screen like the one below. Install WireGuard. 

 <img src="macosx_screenshots/01_wireguard_in_app_store.png" alt="screenshot of WireGuard in the Mac App Store" height="500"/>

## Connect to Bubble via WireGuard
  * Open the WireGuard application if it is not already open. You may find a WireGuard icon in your dock, as shown below. Click it to open WireGuard.

 <img src="macosx_screenshots/02_wireguard_in_dock.png" alt="screenshot of WireGuard in the Mac OS X doc" height="500"/>

  * The WireGuard app should now open. You'll see a screen like the one shown below. Click the "Import tunnel(s) from file" button

 <img src="macosx_screenshots/03_wireguard_initial.png" alt="screenshot of initial WireGuard screen" height="500"/>

  * In the file selection dialog, select the `vpn.conf` file that you downloaded above, and click the "Import" button
  
  * You'll now see a dialog requesting your approval for WireGuard to add a VPN configuration, like the screenshot below. Click "Allow"

 <img src="macosx_screenshots/04_add_vpn_config.png" alt="screenshot of request to allow WireGuard to add a VPN config" height="500"/>

  * You should now see the WireGuard screen with your new VPN added, like the screenshot below

 <img src="macosx_screenshots/05_vpn_added.png" alt="screenshot of WireGuard after adding VPN" height="500"/>

  * Click the "Activate" button to connect to the VPN. The "Status" indicator should change to a green dot with the word "Active" next to it. An example screenshot is shown below.

 <img src="macosx_screenshots/06_vpn_activated.png" alt="screenshot of WireGuard after activating VPN" height="500"/>

  * Click the "Edit" button in the bottom right corner of the WireGuard screen
  * You should see a dialog asking you for your password, like the one below. Enter your password and click "OK"

 <img src="macosx_screenshots/07_edit_vpn.png" alt="screenshot of permission dialog to edit VPN" height="500"/>

  * You should now see a screen to edit the VPN settings like the one shown below. Don't change anything in the big text box. Above the text box, you should see "On-Demand" with a couple of checkboxes. Check both checkboxes "Ethernet" and "Wi-Fi", and click "Save"

 <img src="macosx_screenshots/08_vpn_on_demand.png" alt="screenshot of setting VPN to connect on demand" height="500"/>

  * Congratulations! You are now connected to your Bubble's VPN!
