# Connect an Apple iOS device to your Bubble VPN

## Display your VPN configuration as a QR code
* On another device (not your iPhone or iPad):
   * Login to your Bubble
   * Navigate to the Devices screen
   * In the "Add Device" section, enter a name for your iOS device and click or tap the "Add" button to add it.
   * Click or tap "Show VPN connection info" for your iOS device. A QR code will appear.

## Install WireGuard
* Using your iPhone or iPad:
   * Install the WireGuard App from the [Apple App Store](https://apps.apple.com/us/app/wireguard/id1441195209)

## Connect to Bubble via WireGuard
* Using your iPhone or iPad:
   * Open the WireGuard app
   * In the WireGuard app. You should see a screen like the one shown below. Tap "Add a tunnel". If you don't see "Add a tunnel", tap the Plus icon (+) in the top-right corner of the screen.

 <img src="ios_screenshots/01_wireguard_start.png" alt="screenshot of WireGuard app with no VPNs yet configured" height="500"/>

   * After you tap "Add a tunnel", you should see some buttons appear at the bottom of your screen, as shown below. Tap "Create from QR code"

 <img src="ios_screenshots/02_wireguard_add_tunnel.png" alt="screenshot of WireGuard app with no VPNs yet configured" height="500"/>
 
   * A camera view will open. Scan the QR code shown on your other device. You'll be asked to provide a name for the tunnel. You can choose anything, but it's probably easiest to use the name of your Bubble. See the screenshot below for an example.

 <img src="ios_screenshots/03_set_vpn_name.png" alt="screenshot of WireGuard app adding VPN using QR code" height="500"/>
 
   * You'll now see a pop-up titled "WireGuard Would Like to Add VPN Configurations", like the screenshot shown below. Tap "Allow" and then enter your passcode.

 <img src="ios_screenshots/04_allow_vpn_config.png" alt="screenshot of WireGuard app requesting permission to add a VPN" height="500"/>
 
   * You'll now see your VPN connection listed, as shown below. Tap the toggle switch to turn it on.

 <img src="ios_screenshots/05_vpn_successfully_added.png" alt="screenshot of WireGuard app with a new VPN defined" height="500"/>
 
   * Congratulations! You are now connected to your Bubble's VPN!
