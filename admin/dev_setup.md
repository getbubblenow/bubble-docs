# Bubble Development Environment

## Initial Download and Build
For best results, start with a fresh Ubuntu 18.04. Either the Server or Desktop Ubuntu will work.

  * Download the code: `git clone https://git.bubblev.org/bubblev/bubble.git`

  * Run first-time operating system setup: `./bin/first_time_ubuntu.sh`
    This command will install various apt packages required by Bubble, and configure/setup the initial Bubble PostgreSQL database.
    Note: this command only needs to be run once on a new Ubuntu 18.04 development system.
    
  * Run first-time code setup: `./bin/first_time_setup.sh`
    This command initializes the various git submodules used by Bubble, downloads all required maven dependencies,
    and performs an initial build.
    Note this command only need to be run once after a fresh clone the Bubble git repository.

## Subsequent Updating and Building
If you have an existing Bubble git repository, and would like to update all code (including submodules) to the latest version, run:

    `./bin/git_update_bubble.sh`

After this command completes, your Bubble will be updated to the latest development code, and rebuilt.

## Environment file
You will need a file named `${HOME}/.bubble.env` which contains various environment variables required to run the server.

Talk to another developer to get a copy of this file. Do not ever send this file over email or any other unencrypted channel.
Always use `scp` to copy this file from one machine to another.

After you have the env file in place, create a symlink called `${HOME}/.bubble-test.env`

    cd ${HOME} && ln -s .bubble.env .bubble-test.env
