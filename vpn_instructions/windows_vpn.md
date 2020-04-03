# Connect a Microsoft Windows system to your Bubble VPN

  * Download and install WireGuard for Windows: https://download.wireguard.com/windows-client/wireguard-amd64-0.1.0.msi
    * Note: If you are running a 32-bit version of Windows, you must install the 32-bit version of Wireguard: https://download.wireguard.com/windows-client/wireguard-x86-0.1.0.msi
    * Most newer Windows systems are 64-bit. To determine if your Windows is 64-bit or 32-bit, follow these instructions: https://www.lifewire.com/am-i-running-a-32-bit-or-64-bit-version-of-windows-2624475
  * Run the WireGuard msi installer that you just downloaded
  * You will see a few warning dialogs to confirm that you really want to install WireGuard. Depending on the dialog, click "OK", "Run", "Yes", or "Install" to continue.
  * Login to your Bubble
  * Navigate to the Devices screen
  * In the "Add Device" section, enter a name for your Windows system and click or tap the "Add" button to add it.
  * Click or tap "Show VPN connection info" for your new Windows device. Click the button that reads "Download vpn.conf file"
  * Save the vpn.conf file to your computer.
  * Open the WireGuard application if it is not already open.
  * Click the "Import tunnel(s) from file" button, and select the vpn.conf file that you downloaded.
  * Click the "Activate" button to connect to the VPN.
  * If a "Set Network Location" dialog appears, click on "Public network", then click the "Close" button.
  * Congratulations! You are now connected to your Bubble's VPN!
