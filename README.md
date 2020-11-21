# Useful_Shell_Scripts

<br />

# Introduction
I have been using Linux (mostly Ubuntu and flavours) for almost over a year now. But I still find myself nuking my system and doing a fresh install once in 6 months (during my sem breaks) to keep things clean. And reconfiguring everything can be a really painful job, hence these scripts help me sit back and have cup of coffee while they do this job.

If you use these scripts, do at your risk. I won't take any blame if you get stuck on boot 🤪

<br />

# Which Script does What
A small guide of what you can expect from which script

|   Script  |   Job   |
| ---   |   --- |
|   [setupAndInstallSnap.sh](https://github.com/sarthakpranesh/Useful_Shell_Scripts/blob/master/setupAndInstallSnaps.sh) | I love Snaps more then Flatpaks (you can hate me for that). This script installs snapd and uses snap to install the following snaps: Snap-store, Standard-notes, Spotify, code --classic (Vscode) and Postman |
| [setupDocker.sh](https://github.com/sarthakpranesh/Useful_Shell_Scripts/blob/master/setupDocker.sh)  | As the name suggests, it installs Docker and adds current user to the docker group so that we can use docker command without sudo  |
| [setupGitAndGPG.sh](https://github.com/sarthakpranesh/Useful_Shell_Scripts/blob/master/setupGitAndGPG.sh)  | Installs git if not already installed. Configures the git with adding your name and email (please replace my user details with yours before running) and creates a GPG key that can be added to Github SSH anf GPG keys for verification on commits |
| [setupGoLang.sh](https://github.com/sarthakpranesh/Useful_Shell_Scripts/blob/master/setupGoLang.sh)  | Installs golang and adds the required paths to `.bashrc`. I like my workflow hence it configures that up too, basically all local package installed go to the folder in `~/golib` where as I do active development in `~/Github/GO` using a compound GOPATH   |
| [setupNvmAndReactNative.sh](https://github.com/sarthakpranesh/Useful_Shell_Scripts/blob/master/setupNvmAndReactNative.sh)  | I LOVE JavaScript bro. This script installs NVM or Node Version Manager. Uses it to install Nodejs and uses snap to install Android Studio and configures it. Finally sets up `watchman` required by React Native  |

* The other two folders namely `popos` and `elementaryOs` are basically for setting up `Fusuma` (enables track pad gestures as in Windows and Mac OS ) on POP and Elementary OS respectively.

<br />

## Found Issues
I would love to fix issues with these scripts or work on suggestions so feel free to open Issues if you find any. PRs are welcomed as well.

<br />

<div align="center">

#### Made with ☕️

</div>
