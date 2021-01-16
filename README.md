# Useful Shell Scripts

<br />
<br />

## Introduction
I have been using Linux as a daily driver for almost over 3 years now. But I still find myself nuking my system and doing a fresh install once in 6 months (during my sem breaks) to keep things clean. And reconfiguring everything can be a really painful job, hence these scripts help me sit back and have cup of coffee while they setup stuff for me the way I like it.

Though these scripts are not that dangerous, yet if you use these scripts do at your risk.

<br />
<br />

## What does what
A small guide of what you can expect from these script. Starting with the project structure, this repo has two kinds of scripts `global` and `distro` Specific. All `global` scripts are present in the root of the repo whereas all `distro` specific once are placed under folders like `Debian` {including likes such as Ubuntu/Pop/Elementary} and `Fedora`. `Global` scripts can be used as standalone scripts {such as androidStudio.sh} or are used within `distro` specific scripts {such as reactNative.sh uses androidStudio.sh and other scripts}.

<br />

|   Script  |   Link   |   Job  |   
| --- | --- | --- |
| androidStudio | [Global](https://github.com/sarthakpranesh/Useful_Shell_Scripts/blob/master/androidStudio.sh) | Uses Flatpak to install `Android Studio` and adds important paths to user's `.bashrc` |
| golang | [Global](https://github.com/sarthakpranesh/Useful_Shell_Scripts/blob/master/golang.sh) | Downloads and Installs golang. Adds the required paths to `.bashrc`. I like my workflow hence it configures that up too, basically all local package installed go to the folder in `~/golib` where as I prefer doing active development in `~/Github/GO` using a compound GOPATH |
| nvm | [Global](https://github.com/sarthakpranesh/Useful_Shell_Scripts/blob/master/nvm.sh) | Installs `nvm or Node Version Manager` and uses the `nvm` command to install the latest version of `nodejs` |
| watchman | [Global](https://github.com/sarthakpranesh/Useful_Shell_Scripts/blob/master/watchman.sh) | Downloads Facebook's `watchman` release, extracts and places the binaries under required paths, changes permission to binary executables, adds some necessary configs and restarts watchman  |
| gitConfig | [Global](https://github.com/sarthakpranesh/Useful_Shell_Scripts/blob/master/gitConfig.sh) | `IMPORTANT! Please Read Before Using This Script`: This script is used to configure git {if already installed, if not then use `git` script}. Therefor this script contains some params that you'll be required to add before hand such as your git username and email  |
| git | [Debian/Ubuntu/Based](https://github.com/sarthakpranesh/Useful_Shell_Scripts/blob/master/Debian/git.sh), [Fedora](https://github.com/sarthakpranesh/Useful_Shell_Scripts/blob/master/Fedora/git.sh) | This script install git if not installed and executes gitConfig script {therefore make sure you added your git credentials in the gitConfig script} |
| docker | [Debian/Ubuntu/Based](https://github.com/sarthakpranesh/Useful_Shell_Scripts/blob/master/Debian/docker.sh), [Fedora](https://github.com/sarthakpranesh/Useful_Shell_Scripts/blob/master/Fedora/docker.sh) | Installs Docker and required components. Adds user to the docker group so that docker command can be used without `sudo` |
| reactNative | [Debian/Ubuntu/Based](https://github.com/sarthakpranesh/Useful_Shell_Scripts/blob/master/Debian/reactNative.sh), [Fedora](https://github.com/sarthakpranesh/Useful_Shell_Scripts/blob/master/Fedora/reactNative.sh) | Calls a bunch of `global` scripts {nvm, androidStudio, watchman in order} and installs `openjdk-8` as they are the dependencies required for `React Native` |
| fusuma | [Debian/Ubuntu/Based](https://github.com/sarthakpranesh/Useful_Shell_Scripts/blob/master/Debian/fusuma.sh) | Installs `Ruby`, `libinput-tools`, `xdotool` and `Fusuma` {touch pad gestures} and configures it for use on either Elementary or Pop OS |
| archSetup | [Arch](https://github.com/sarthakpranesh/Useful_Shell_Scripts/blob/master/Arch/archSetup.sh) | Automated installation of Arch linux. Installs xorg and gnome as the desktop environment. Sets up grub for EFI devices (if you are using a non efi device then use `arch-chroot /mnt` and install grub again). It is advised to read the script once for comments and documentation so that you can make any necessary changes if required. |

<br />
<br />

## Goal and Future Work
My goal with these scripts is simple, and that is to save myself tons of time that I might spend configuring, installing and setting things up the way I like it, and in the same time learn shell scripting

<br />

In the future I am looking to extend this project and include achieve the following
* Work on script to help automate my arch installation (DONE)
* More reliable scripts
* Single shot shell script program to do it all

<br />
<br />

## Found Issues
I would love to fix issues with these scripts or work on suggestions so feel free to open Issues if you find any. PRs are welcomed as well.

<br />
<br />

<div align="center">

#### Made with ☕️

</div>
