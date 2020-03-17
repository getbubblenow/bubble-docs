 * Login to your Bubble
 * Go to "Devices"
 * In the "Download Certificate" section, click "Linux"
 * Save the file
 * As root, copy the file to `/usr/share/ca-certificates/extra`. Create this directory if it does not already exist
 * As root, run `dpkg-reconfigure ca-certificates`
 * You'll see the question "Trust new certificates from certificate authorities?", select "Yes"
 * You'll see a list titled "Certificates to activate". Your new Bubble certificate should appear at the top. If it is not selected, press the space bar to select it.
 * Press Enter to continue
 * Congratulations! You have successfully installed your Bubble certificate!

