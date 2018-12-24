[&laquo; Installation]()  // [&ldca; Getting Started]() // [Configuration &raquo;]()

# Usage

Usage guide for Arduino-Makefile.

Need information on how to get Arduino-Makefie set up on your system? [Go here]().

#### Table of Contents
<!-- Created by [github-markdown-toc](https://github.com/ekalinin/github-markdown-toc.go) -->

  * [Quick Start](#quick-start)
  * [Using Make](#using-make)
  * [Makefiles](#makefiles)
  * [Use Case Examples](#use-case-examples)
  * [Setting Variables](#setting-variables)


## Quick Start

Arduino-Makefile attempts to autodetect most of the variables you will need to compile your project. So in many cases, all you will need for your project Makefile is:

```make
# $PROJECT_DIR/Makefile
BOARD_TAG    = leonardo
include $(ADMK_DIR)/Arduino.mk
```

Then run:

```
$ make
$ make upload
```

Some other variables you may wish to set include:

- `BOARD_TAG` - Type of board, for a list see boards.txt or `make show_boards`. Defaults to `uno`.
- `MONITOR_PORT` - The port where your Arduino is plugged in, usually `/dev/ttyACM0` or `/dev/ttyUSB0` in Linux or Mac OS X and `com3`, `com4`, etc. in Windows. Arduino-Makefile will attempt to detect your port and set it.
- `ARDUINO_DIR` - Path to Arduino IDE installation. Arduino-Makefile will look in the default install paths for each platform and set it if found.
- `ARDMK_DIR`   - Path where the master `*.mk` files are located. If you installed the package, then it is usually `/usr/share/arduino`.
- `AVR_TOOLS_DIR` - Path where the avr tools chain binaries are located. Defaults to the tools bundled with your Arduino IDE (1.5+). Set to relative and not absolute. <!-- QUESTION: Is this true? -->

Note: On Windows all paths should use Unix-style forward slashes `/` and not Windows-style back slashes `\\`.
For example `C:/Arduino` not `C:\\Arduino`.

## Using Make

To see all of the commands (or make targets) available run `make help`. This will start with the current configuration, and how each variable was set.

```sh
make help | less
```

To see a detailed list of available varaibles and their meanings:

```sh
make help_vars | less
```

Note: if you see the error `make: *** No rule to make target \`help'.` it is because you have no Makefile in the current directory.

## Makefiles

Arduino-Makefile provides a number of `.mk` files for you to include in your projects `Makefile`.

- Arduino.mk -- Makefile for Arduino AVR boards.
- OpenCM.mk -- Makefile for Robotis OpenCM boards.
- Sam.mk -- Makefile for Arduino Atmel SAM boards (sam and samd)
- Teensy.mk -- Makefile for Teensy 3.x boards.
- chipKIT.mk -- Makefile for systems using the chipKit development platform.

## Use Case Examples

In the examples directory, you will find a number of projects that demonstrate various usage patterns. Each project includes a Makefile that you can look at to learn how to configure that particular use case or copy as a template.

For example, `ATtinyBlink` shows you how to set up your Makefile if you use a different core (board platform) like ATtiny.

```
cd "$ADMK_DIR/examples/ATtiny"
less Makefile
```

Build example projects and upload them to a board to test if your system is working.

```
make && make upload
```

The master Makefile itself is a resource with detailed comments that you can browse to learn more.
```
less "$ADMK_DIR/Arduino.mk"
```


## Setting Variables

Variable defaults are set by the master Makefile and will be overridden by the ones you set.
Variable prescedence is: Master Makefile > Environment Variables > Project Makefile.

You can set envionment variables in your .bashrc or .bash_profile. This is useful for variables that will rarely if ever change for your machine.

```sh
# $HOME/.bashrc
export MONITOR_PORT="/dev/ttyACM0"
```

You can also set environment variables at the time that you run `make` to apply to just that build.

Note: This will override any variable set in your .bashrc or .bash_profile, but will be overridden by any variables set in your project Makefile.

```
$ export MONITOR_PORT="/dev/ttyACM0"
$ make help | grep 'BOARD_TAG ='
```

Finally, variables can be set in the Makefile for your project. This is where you'll put variables that apply to a specific project.

```make
# <PROJECT PATH>/Makefile
BOARD_SUB         = atmega2560
```

[&laquo; Installation]()  // [&ldca; Getting Started]() // [Configuration &raquo;]()
