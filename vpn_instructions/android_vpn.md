* On another device (not your Android device):
   * Login to your Bubble
   * Navigate to the Devices screen
   * In the "Add Device" section, enter a name for your Android device and click or tap the "Add" button to add it.
   * Click or tap "Show VPN connection info" for your new Android device. A QR code will appear.

* On your Android device:
   * Install the Wireguard from the Google Play Store: https://play.google.com/store/apps/details?id=com.wireguard.android
      * Alternatively, if you have access to the F-Droid App Store, you can install from: https://f-droid.org/en/packages/com.wireguard.android/
   * Open the Wireguard app
   * In the Wireguard app, tap "Add a tunnel". If you don't see "Add a tunnel", tap the Plus icon (+) in the top-right corner of the screen.
   * Tap the "Create from QR code" button
   * You Android device will ask you to allow Wireguard to use your camera. Allow this.
   * A camera view will open. Scan the QR code shown on your other device. You'll be asked to provide a name for the tunnel. You can choose anything, but it's probably easiest to use the name of your Bubble.
   * A new connection will now appear in Wireguard. Tap the toggle control to turn it on.
   * You'll now see a pop-up titled "Connection Request". Tap "OK" to allow the connection.
   * To ensure your device always remains connected to your Bubble, open the "Settings" app on your Android device
   * Tap "Connections"
   * Tap "More Connection Settings"
   * Tap "VPN"
   * You should see your Wireguard VPN listed. Tap the gear icon to open its settings.
   * Tap the "Always-on VPN" toggle to enable always-on behavior
   * Optionally, also turn on the "Block connections without VPN" setting
   * Congratulations! You are now connected to your Bubble's VPN!
