## Bubble Tools for Ubuntu
On the Ubuntu system you want to connect to your Bubble, do the following:

### Download the Bubble binary
Download the [latest Bubble release](https://jenkins.bubblev.org/public/releases/bubble/latest/bubble.zip)

Open a command-line terminal.

### Unpack the zip file
Unzip the file that you downloaded:

    unzip bubble.zip

Change directories into the directory containing the files that were unzipped:

    cd bubble-Adventure_1.x.x     # replace `Adventure_1.x.x` with the version that you downloaded

### Connect to your Bubble
From the `bubble-Adventure_1.x.x` directory, run:

    ./bin/ubuntu_connect_bubble hostname-of-your-bubble

Where `hostname-of-your-bubble` is the hostname of your Bubble.

This command will handle all system configuration and 

### Disconnect from your Bubble
From the `bubble-Adventure_1.x.x` directory, run:

    ./bin/ubuntu_disconnect_bubble

This will simply disconnect from the VPN.

### Delete device from Bubble
To remove your Ubuntu system completely from your Bubble, run:

    ./bin/ubuntu_disconnect_bubble delete

This will remove the device from the Bubble and delete all local files.
