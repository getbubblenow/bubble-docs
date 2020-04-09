# Connect a Microsoft Windows system to your Bubble VPN

## Download the vpn.conf file
  * Login to your Bubble
  * Navigate to the Devices screen
  * Find your device in the device list, or [add your Windows system as a device](../add_device.md)
  * Click or tap "Show VPN connection info" for your new Windows device. Click the button that reads "Download vpn.conf file". A dialog will appear similar to the one shown below. 
  <img src="windows_screenshots/05_save_vpn_file.png" alt="screenshot of downloading vpn.conf file" height="500"/>

  * Choose "Save File" and save the vpn.conf file to your computer.

## Install WireGuard
  * Download and install [WireGuard for Windows](https://download.wireguard.com/windows-client/wireguard-amd64-0.1.0.msi)
    * Note: If you are running a 32-bit version of Windows, you must install the [32-bit version of Wireguard](https://download.wireguard.com/windows-client/wireguard-x86-0.1.0.msi)
    * Most newer Windows systems are 64-bit. To determine if your Windows is 64-bit or 32-bit, [follow these instructions](https://www.lifewire.com/am-i-running-a-32-bit-or-64-bit-version-of-windows-2624475)
    * You can find more information about the WireGuard installers on the [WireGuard Installation page](https://www.wireguard.com/install/)
  * Run the WireGuard msi installer that you just downloaded. You'll see a screen similar to the one shown below.
  <img src="windows_screenshots/01_run_wireguard.png" alt="screenshot of Open File dialog that appears when starting WireGuard msi installation" height="500"/>

  * Click "Open"  
  <img src="windows_screenshots/02_install_wireguard.png" alt="screenshot of User Account Control dialog that appears when starting WireGuard msi installation" height="500"/>

  * Click "Yes"
  <img src="windows_screenshots/03_install_wireguard.png" alt="screenshot of Windows Security dialog that appears when starting WireGuard msi installation" height="500"/>

  * Click "Install"  
  * The WireGuard application then opens, and you should see a screen like the one below.
    <img src="windows_screenshots/04_import_tunnel_from_file.png" alt="screenshot of WireGuard initial screen" height="500"/>

## Connect to Bubble via WireGuard
  * In the WireGuard application, click "Import tunnels(s) from file", and select the vpn.conf file that you downloaded. You should now see a screen like the one shown below.
  <img src="windows_screenshots/07_activate_vpn.png" alt="screenshot of WireGuard with Bubble VPN added" height="500"/>

  * Click the "Activate" button to connect to the VPN.
  * You should now see a "Set Network Location" dialog, like the one shown below. Click on "Public network", then click the "Close" button.
  <img src="windows_screenshots/08_set_network_location.png" alt="screenshot of Set Network Location dialog" height="500"/>

  * The next screen will ask you to confirm this network location. It should look like the screenshot below. Click "Close".
  <img src="windows_screenshots/09_confirm_network_location.png" alt="screenshot of Set Network Location confirmation dialog" height="500"/>
  
  * Congratulations! You are now connected to your Bubble's VPN!
