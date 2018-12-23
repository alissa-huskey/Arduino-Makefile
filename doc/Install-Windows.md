# Windows Installation for Arduino-Makefile

A guide to setup of Arduino-Makefile including installing its requirements and system configuration for Windows.

**Table of Contents**
<!--- Created by [github-markdown-toc](https://github.com/ekalinin/github-markdown-toc.go) --->

  * [Feelin' Lucky?](#feelin-lucky)
  * [Install Requirements](#install-requirements)
    * [Cygwin](#cygwin)
    * [Arduino IDE](#arduino-ide)
    * [AVR Tools](#avr-tools)
    * [pySerial](#pyserial)
    * [Arduino\-Makefile](#arduino-makefile)
  * [Configure Your System](#configure-your-system)
    * [Create a \.bashrc](#create-a-bashrc)
    * [Create symbolic link](#create-symbolic-link)
    * [Set system\-wide Arduino\-Makefile variables](#set-system-wide-arduino-makefile-variables)


## Feelin' Lucky?

Assuming that you have Cygwin, a working .bashrc, the Arduino IDE 1.5+, and the other required packages already installed, here is the bare minimum install process:

```sh
$ export CYGWIN="winsymlinks:native"
$ ln -s /cygdrive/c/Program Files\ \(x86\)/Arduino/ C:/Arduino
$ echo 'export ARDUINO_DIR="C:/Arduino"' >> "$HOME/.bashrc"
$ source "$HOME/.bashrc"
$ pip install pyserial
$ git clone git@github.com:sudar/Arduino-Makefile.git
$ cd Arduino-Makefile
$ echo 'export ARDMK_DIR="'"$(pwd -P)"'"' >> "$HOME/.bashrc"
$ cd examples/Blink
$ make
$ make upload  # assumes an arduino uno board plugged in
```

See below for more detailed instructions, additional steps you may wish to take, and variables you might want to set for your system.


## Install Requirements

### Cygwin

If you don't already have it, install Cygwin:

https://www.cygwin.com/install.html

When you run the setup.exe, select the following packages to be installed:

  * perl
  * make
  * python3
  * python3-pip
  * git

If you already have it installed, you can run the setup.exe again to add any missing packages.

### Arduino IDE

If you do not already have the Arduino IDE installed, follow the [this guide](https://www.arduino.cc/en/Guide/windows) to install it.


### AVR Tools

AVR Tools are bundled with your Arduino IDE (1.5+) and Arduino-Makefile use those by default.

However, the version bundled with the IDE is quite old. As of Arduino 1.8.8 the bundled version of avr-gcc is 5.4, while the current version is 8.4. So you may wish to install a more modern version.

If you wish to upgrade to a more modern version of avr-gcc it looks like the way to do so is WinAVR. See [this detailed writeup](http://www.nongnu.org/avr-libc/user-manual/install_tools.html).



### pySerial

You should have installed pip above, so you can simply:

```
pip install pyserial
```

Alternately, you can install it from source.

Download it [here](https://pypi.python.org/pypi/pyserial) then:

```sh
$ tar xvzf pyserial-X.X.tar.gz
$ cd pyserial-X.X
$ python setup.py build
$ python setup.py install
```

### Arduino-Makefile

Clone from github:

```sh
git clone git@github.com:sudar/Arduino-Makefile.git
```

## Configure Your System

**NOTE: Within Cygwin, use forward slash not backslash and there should be no spaces or special characters in the Windows paths (due to Win/Unix crossover).  The paths should not be *cygdrive* paths.**

### Create a .bashrc

Create a .bashrc if you do not already have one:
```sh
$ [[ ! -f "$HOME/.bashrc" ]] && cp /etc/skel/.bashrc "$HOME/"
```

### Create symbolic link

It is recommended in Windows that you create a symbolic link to avoid problems with file naming conventions on Windows due to special characters in the default directory name `C:\Program Files (x86)\Arduino`.  ([more info](https://github.com/sudar/Arduino-Makefile/issues/94))

To create the link in Cygwin, use the CYGWIN environment variable to temporarily set the way symlinks are created. ([more info](https://www.cygwin.com/cygwin-ug-net/using-cygwinenv.html))
```sh
$ export CYGWIN="winsymlinks:native"
$ ln -s /cygdrive/c/Program Files\ \(x86\)/Arduino/ C:/Arduino
```

Alternately, you can create the link from a MS-DOS shell:
```dos
mklink /d C:\Arduino C:\Program Files (x86)\Arduino
```

### Set system-wide Arduino-Makefile variables

All Arduino-Makefile parameters can be set in either the Makefile or as an environment variables.

These are the main parameters you might want to set that apply to your system.
These instructions will set them as environment variables so that they will persist across all of your projects.
Just know you can choose to set them your Makefile instead of or in addition to setting environment variables.

Append the following to your .bashrc:
```sh
export ARDUINO_DIR="C:/Arduino"  # symbolic link to Arduino IDE, see above
export ARDMK_DIR="<PATH>"        # path to Arduino-Makefile
# export MONITOR_PORT="com3"     # uncomment if not auto-detected
```

If you use MSYS and PuTTY, you might want to set the following extra parameters:

```sh
export MONITOR_CMD="putty"
export MONITOR_PARMS="8,1,n,N"
```
