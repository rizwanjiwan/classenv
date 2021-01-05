# Class Developer Environment
Hi!

This page/repo is for the class I'm holding. It is here to help you get your computer all setup and ready to go before our first class. We'll be starting out with [PHP](https://www.php.net) (language) and moving on from there.

## Prerequisites
To take this class you need some basic background, skills, and equipment. Specifically:
- Reasonable proficiency using your computer including opening apps & installing apps
- Proficiency with basic terminal operations. You might be able to muddle through as we go/google what you need
- Comfort typing at moderate to quick speed
- A computer that runs either Mac OS X+ or Linux

## Installing software you need:
You frankly might not understand any of this but it's important to get this setup out of the way. Over time we'll learn more about all of these steps.

Note, if you're on a newer Apple M1 processor, you'll need to reach out to me for some help since some of the commands below won't just work out of the box.
### Mac OS X setup: 
1. Open the terminal (in your Applications/Utilties folder) and install xcode by running the following command and working through the install from the window that pops up: `xcode-select --install`
2. Install [homebrew](https://brew.sh) with the following command in the Terminal: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
2. Install [Docker Desktop](https://www.docker.com/products/docker-desktop) by opening the terminal and running this command: `brew install --cask docker`
3. Install [Git](https://git-scm.com/downloads) for source control by opening the terminal and running this command: `brew install git`
4. Install [Github Desktop](https://desktop.github.com) for an easier interface to Git, run this command: `brew install --cask github`
5. Some sort of developer environment for PHP. A totally free one that's very good is [Visual Studio Code](https://code.visualstudio.com) (VSC). Install VSC by running this command `brew install --cask visual-studio-code`

That should set you up with all the core software you need to continue.

### Other operating systems

For other setups, just skip step 1 and 2 for the Mac OS X setup above and click on the links to get instructions for your platform.

## Setting up Visual Studio Code (VSC)
1. Open VSC from your applications folder
2. At the bottom of the black bar on the left-hand side, click extensions.
3. Search for and install the following extensions: 
   - Composer
   - Docker
   - gitignore
   - GitLens
   - PHP DockBlocker
   - PHP Intelephense
   - PHP Namespace Resolver 

## Setting up a container (Docker)

Docker is a tool we use to build a "container." The simplest way to think about it is it allows us to have a standardized "computer inside your computer" which will hold all the stuff we need to run the software we write. Here are the steps to setup our Docker container.

Before you do any of this, be sure to open Docker Desktop (Docker.app on Mac OS X).

1. Open a terminal and navigate to your Desktop (you can choose some other location and just replace Desktop with any other location of your choice for the rest of the setup), type: `cd ~/Desktop/`
2. Make a directory where we'll store all of our work, type: `mkdir Code`
3. Go into that directory `cd Code` and get this repository from github, type: `git clone git@github.com:rizwanjiwan/classenv.git`
4. Make a directory for our code, type: `mkdir app/www`
5. Go into the docker project, type: `cd classenv`
6. Make a container, type: `docker-compose up`
7. Wait until you see `Creating classenv_devenviroment_1 ... done` show up (note the "done"). Then hit control-c (ctrl-c) to close down the container.

You can now close your terminal and open up Docker Desktop and skip any tutorial you are offered. You should see "Containers/Apps" on the left hand side. Select that and then you should see "classenv." 

In the future you can start and stop the container by clicking the play/stop buttons next to classenv. Let's test our setup by first clicking play:
1. Open Visual Studio code
2. Open the folder "app" we created in step 4 above
3. Create a file titled index.php inside the app/www directory.
4. In that file, type the following code and save the file:
``<?php
   echo "Hello world!";``
5. Open your browser and navigate to http://localhost/. You should see "Hello world!" on the screen!

Feel free to stop the container now by clicking the stop button in Docker Desktop. 

## Summation
I get it, that seems like a lot, but it's a one time setup, and it will make the rest of our journey together a lot easier. It's important to learn by reading when you're writing code. If you run into any problems above, a quick Google or the error message or other related information will often yield the answer. Please try to self troubleshoot, it's an important skill for sure.
