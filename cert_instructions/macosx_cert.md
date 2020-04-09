# Install your Bubble Certificate on an Apple Mac OS X system

### Download the Certificate
  * Login to your Bubble
  * Go to "Devices"
  * In the "Download Certificate" section, click "Mac OS X"
  * In the file dialog, choose "Save File", as shown below

 <img src="macosx_screenshots/01_download_cert.png" alt="screenshot of download certificate dialog" height="500"/> 

  * Open the "Keychain Access" app, you should see something like the screenshot below
  
 <img src="macosx_screenshots/02_keychain_access.png" alt="screenshot of Keychain Access app" height="500"/>

  * Select the "login" keychain from the "Keychains" list in the top-left panel
  * From the "File" menu, choose "Import Items...", as shown below
  
 <img src="macosx_screenshots/03_import_items.png" alt="screenshot of 'import items' in Keychain Access app" height="500"/>

  * In the file selection dialog, find the Certificate file that you downloaded earlier and click "Open"
  * Right-click (or Control-Click) on the Certificate that you just added and choose "Get Info", as shown below
  
 <img src="macosx_screenshots/04_cert_get_info.png" alt="screenshot of 'Get Info' after adding certificate" height="500"/>

  * Toggle the arrow next to the "Trust" section to expand it, and the top drop-down box which reads "When using this certificate:", select "Always Trust". The screenshot below is illustrative:
  
 <img src="macosx_screenshots/05_cert_trust.png" alt="screenshot of certificate dialog with 'Trust' section expanded" height="500"/>

  * Close the Certificate info dialog.
  * An authorization dialog will appear like the one shown below. Enter your Mac user name and password and click "Update Settings" to authorize the change.

 <img src="macosx_screenshots/06_confirm_trust.png" alt="screenshot of dialog to confirm changes to certificate trust" height="500"/>

  * Close the "Keychain Access" application.
  * Congratulations! You have successfully installed your Bubble certificate!
  * NOTE: if you use the Firefox web browser, you must also separately [install your Bubble Certificate in Firefox](firefox_cert.md)
