[&ldca; Getting Started](GettingStarted.md) // Finish [Installation &raquo;](Install.md#board-platform-support)

----

# MacOS Installation Guide for Arduino-Makefile

A guide to setup of Arduino-Makefile including installing its requirements and system configuration for MacOS.

#### Table of Contents
<!--- Created by [github-markdown-toc](https://github.com/ekalinin/github-markdown-toc.go) --->

  * [Feelin' Lucky?](#feelin-lucky)
  * [Install Requirements](#install-requirements)
    * [Arduino IDE](#arduino-ide)
    * [AVR Tools](#avr-tools)
    * [pySerial](#pyserial)
    * [Arduino\-Makefile](#arduino-makefile)
  * [Configure Your System](#configure-your-system)


## Feelin' Lucky?

Assuming that you already have the Arduino IDE 1.5+ installed, here is the bare minimum install process:

```sh
$ pip install pyserial
$ git clone git@github.com:sudar/Arduino-Makefile.git
$ cd Arduino-Makefile
$ echo 'export ARDMK_DIR="'"$(pwd -P)"'"' >> "$HOME/.bash_profile"
$ cd examples/Blink
$ make
$ make upload  # assumes an arduino uno board plugged in
```

See below for more detailed instructions, additional steps you may wish to take, and variables you might want to set for your system.

## Install Requirements

### Arduino IDE

Install the Arduino IDE.

You can install it via brew cask:
```sh
$ brew cask install java
$ brew cask install arduino
```

Or follow the [official Arduino guide](https://www.arduino.cc/en/Guide/MacOSX) to download and and install a DRM.

### AVR Tools

AVR Tools are bundled with your Arduino IDE (1.5+) and Arduino-Makefile use those by default.

However, the version bundled with the IDE is quite old. As of Arduino 1.8.8 the bundled version of avr-gcc is 5.4, while the current version is 8.4. So you may wish to install a more modern version.

To install using homebrew:
```sh
$ brew tap osx-cross/avr
$ brew install avr-gcc
$ brew install avrdude

# verify that it works:
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

All Arduino-Makefile parameters can be set in either the Makefile or as an environment variables.

These are the main parameters you might want to set that apply to your system.
These instructions will set them as environment variables so that they will persist across all of your projects.
Just know you can choose to set them your Makefile instead of or in addition to setting environment variables.


> Append to your .bash_profile:
```sh
# $HOME/.bash_profile
export AVR_TOOLS_DIR="/usr/local"      # path to avr-gcc and avrdude, if installed via brew
# export ARDMK_DIR="/usr/local"        # path to Arduino-Makefile; uncomment if you installed via package manager

# uncomment the following if not auto-detected
# export ARDUINO_DIR="/Applications/Arduino.app/Contents/Resources/Java" # 1.0.X # path to Arduino IDE
# export ARDUINO_DIR="/Applications/Arduino.app/Contents/Java"           # 1.5+  # path to Arduino IDE
# export ARDMK_DIR="/usr/local"                                          # path to Arduino-Makefile, if installed with a package manager
# export AVR_TOOLS_DIR="/usr"                                            # path to avr-gcc and avrdude
# export MONITOR_PORT="/dev/ttyACM0"                                     # serial monitor port
```

----

[&ldca; Getting Started](GettingStarted.md) // [^Table of Contents^](#table-of-contents) // Finish [Installation &raquo;](Install.md#board-platform-support)
