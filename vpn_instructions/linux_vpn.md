  * Install Wireguard by following the instructions for your Linux distribution at from: https://www.wireguard.com/install/
  * Login to your Bubble
  * Navigate to the Devices screen
  * In the "Add Device" section, enter a name for your Linux system and click or tap the "Add" button to add it.
  * Click or tap "Show VPN connetion info" for your new Linux device. Click the button that reads "Download vpn.conf file"
  * After you have downloaded the file, as the root user, copy the file to `/etc/wireguard/wg0.conf`
  * As root, run `wg-quick up wg0`
  * Congratulations! You are now connected to your Bubble's VPN!
