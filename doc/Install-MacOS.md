# MacOS Installation Guide for Arduino-Makefile

A guide to setup of Arduino-Makefile including instaling its requirements and system configuration for MacOS.

Table of Contents
=================
<!--- Created by [github-markdown-toc](https://github.com/ekalinin/github-markdown-toc.go) --->

  * [Feelin' Lucky?](#feelin-lucky)
  * [Install Requirements](#install-requirements)
    * [Arduino IDE](#arduino-ide)
    * [AVR Tools](#avr-tools)
    * [pySerial](#pyserial)
    * [Arduino\-Makefile](#arduino-makefile)
  * [Configure Your System](#configure-your-system)


## Feelin' Lucky?

Assuming that you already have the Arduino IDE 1.5+ installed, here is the shortest path to a test install.

```sh
$ pip install pyserial
$ git clone git@github.com:sudar/Arduino-Makefile.git
$ cd Arduino-Makefile/examples/Blink
$ make
$ make upload  # assumes an arduino uno board plugged in
```

## Install Requirements

### Arduino IDE

Install the Arduino IDE.

You can install it via brew cask:
```sh
$ brew cask install java
$ brew cask install arduino
```

Or follow this guide:
https://www.arduino.cc/en/Guide/MacOSX

### AVR Tools

homebrew
```sh
$ brew tap osx-cross/avr
$ brew install avr-gcc
$ brew install avrdude

# verify it worked
$ avr-gcc --version
$ avrdude -v
```

### pySerial

On most systems this will work:

```sh
$ pip install pyserial             # universal, install via pip
```

If you prefer to install it as a package, then you can do that as well.

```sh
$ easy_install -U pyserial         # universal, install via easy_install
$ sudo port install py27-serial    # MacPorts
```

### Arduino-Makefile

Many projects include Arduino-Makefile as a git submodule, which does not require a system-wide install. So, the quickest way to get started for our purposes is to simply use git clone:

```sh
$ git clone git@github.com:sudar/Arduino-Makefile.git
```

If you do wish to install Arduino-Makefile with a package manager, you can do that too.

```sh
$ brew tap sudar/arduino-mk
$ brew install arduino-mk
```

## Configure Your System

### Set system-wide Arduino-Makefile variables

The following paramaters can be set in either the Makefile or as an environment variables. Because these are system-wide settings, these instructions will show you how to set them as environment variables so that they will persist across all of your projects. You can choose to set them your Makefile instead, or override them there on a per-project basis.

Append the following to your .bash_profile:

```sh
# append to $HOME/.bash_profile
export AVR_TOOLS_DIR="/usr"      # path to avr-gcc and avrdude
# export ARDMK_DIR="/usr/local"  # path to Arduino-Makefile; uncomment if you installed via package manager

# uncomment the following if not auto-detected
# export ARDUINO_DIR="/Applications/Arduino.app/Contents/Resources/Java" # 1.0.X # path to Arduino IDE
# export ARDUINO_DIR="/Applications/Arduino.app/Contents/Java"           # 1.5+  # path to Arduino IDE
# export ARDMK_DIR="/usr/local"                                          # path to Arduino-Makefile, if installed with a packag manager
# export AVR_TOOLS_DIR="/usr"                                            # path to avr-gcc and avrdude
# export MONITOR_PORT="/dev/ttyACM0"                                     # serial monitor port
```
