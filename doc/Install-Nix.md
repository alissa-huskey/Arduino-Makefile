# *Nix Systems Installation for Arduino Makefile

A guide to setup of Arduino-Makefile including instaling its requirements and system configuration for *Nix systems.

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
$ echo 'export ARDUINO_DIR="<SET PATH HERE>/arduino-X-X-X"' >> "$HOME/.bashrc"
$ source "$HOME/.bashrc"
$ pip install pyserial
$ git clone git@github.com:sudar/Arduino-Makefile.git
$ cd Arduino-Makefile/examples/Blink
$ make
$ make upload  # assumes an arduino uno board plugged in
```

## Install Requirements

### Arduino IDE

If you do not already have the Arduino IDE installed, follow the guide here to install it.

https://www.arduino.cc/en/guide/linux

Be sure to put your download somewhere sensible and make note of the path as it will be your ARDUINO_DIR, needed later.

You will end up with a directory named arduino-X-X-X. Common install locations include /usr/local and $HOME.


### AVR Tools

AVR Tools are bundled with your Arduino IDE 1.5+ and Arduino-Makefile will look for them there without needing to install a seperate package.

However, the version bundled with the IDE is quite old. As of Arduino 1.8.8 the bundled version of avr-gcc is 5.4, while the current version is 8.4. So you may wish to install an independent instance of these tools.

First, check to see if it's already installed with:

```sh
$ avr-gcc --version
$ avrdude -v
```

apt or aptitude
```sh
$ sudo apt-get install gcc-avr binutils avr-libc avrdude
```

linuxbrew
```sh
$ brew tap osx-cross/avr
$ brew install avr-gcc
$ brew install avrdude
```

Verify everything is working:

```sh
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
$ apt-get install python-serial    # Debian or Ubuntu
$ yum install pyserial             # Fedora
$ dnf install pyserial             # Fedora 22+
$ zypper install python-serial     # openSUSE
$ sudo pacman -S python-pyserial   # Arch Linux
```

### Arduino-Makefile

Many projects include Arduino-Makefile as a git submodule, which does not require a system-wide install. So, the quickest way to get started for our purposes is to simply use git clone:

```sh
git clone git@github.com:sudar/Arduino-Makefile.git
```

If you do wish to install Arduino-Makefile via a package manager, you can do that too.

apt or aptitude for FreeBSD, Debian, Raspbian or Ubuntu:
```sh
sudo apt-get install arduino-mk
```

[AUR](https://aur.archlinux.org/packages/arduino-mk/) (unofficial) for Arch Linux
```sh
yay -S arduino-mk
```

[linuxbrew](https://github.com/Homebrew/linuxbrew)
```sh
$ brew tap sudar/arduino-mk
$ brew install arduino-mk
```

Fedora Linux users can use our packaging instructions [here](https://github.com/sudar/Arduino-Makefile/tree/master/packaging/fedora)
to build an RPM.

## Configure Your System

### Set system-wide Arduino-Makefile variables

The following paramaters can be set in either the Makefile or as an environment variables. Because these are system-wide settings, these instructions will show you how to set them as environment variables so that they will persist across all of your projects. You can choose to set them your Makefile instead, or override them there on a per-project basis.

Append to your .bashrc

```sh
# append to $HOME/.bashrc
export ARDUINO_DIR="<PATH>/arduino-X-X-X" # path to the Arduino IDE
export AVR_TOOLS_DIR=/usr/include         # path to avr-gcc and avrdude, if you installed them seperate from the IDE
# export ONITOR_PORT  = /dev/ttyACM0      # uncomment if not auto-detected
```
