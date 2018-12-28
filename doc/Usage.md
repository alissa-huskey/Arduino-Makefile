[&laquo; Installation](Installation.md)  // [&ldca; Getting Started](GettingStarted.md) // [Configuration &raquo;](Configuration.md)

----

# Usage

Usage guide for Arduino-Makefile.

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

> Note: On Windows all paths should use Unix-style forward slashes `/` and not Windows-style back slashes `\\`.  For example `C:/Arduino` not `C:\\Arduino`.

More information on available variables found in the [Configuration](Configuration.md) section.

## Using Make

### Getting Information

```
$ make help              # show this help
$ make help_vars         # print all variables that can be overridden
$ make show_boards       # list all the boards defined in boards.txt
$ make show_submenu      # list all board submenus defined in boards.txt
```

All `make` commands will display the compiled configuration at the top, listing the variables and how they were determined. This is useful for debugging problems with your environment setup.

It will look something like this:

```
-------------------------
Arduino.mk Configuration:
- [AUTODETECTED]       CURRENT_OS = MAC
- [USER]               ARDUINO_DIR = /Applications/Arduino.app/Contents/Java
- [AUTODETECTED]       ARDUINO_VERSION = 188
- [DEFAULT]            ARCHITECTURE = avr
- [DEFAULT]            ARDMK_VENDOR = arduino
...
```

Since the output of the above commands is long, it can be helpful to run them through a pager like `less`.

```
$ make help | less   # arrows to scroll, q to exit
```

### Building

```
$ make                   # compile the code (shortcut to make all)
$ make all               # compile the code
```

### Uploading
```
$ make upload            # upload
$ make ispload           # upload using an ISP
$ make raw_upload        # upload without first resetting
$ make eeprom            # upload the eep file
$ make raw_eeprom        # upload the eep file without first resetting
```

### Using the Serial Monitor

Arduino-Makefile provides an alternative to the Arduino graphical IDE Serial Monitor using `screen`.

```
$ make monitor           # connect to the Arduino's serial port
```

`screen` is a virtual terminal, so the commands you type will be sent to the program you run within the terminal--in this case, through the serial port to the board. To send commands to `screen` instead of to the board, you will first send the command character `<CTRL-A>` to signal that this is for `screen`, followed by a one additional command keystroke.

A few commands you might want to know to use the serial monitor:

```
<CTRL-A> k       # kill the current screen; use this to exit the serial monitor
<CTRL-A> <ESC>   # enter copy/scrollback mode; use this to scroll up or down in the serial monitor
<ESC>            # exit copy/scrollback mode
```

For more information on how to use screen visit the man page by typing `man screen`.

### Development Tools

```
$ make clean             # remove all our dependencies
$ make depends           # update dependencies
$ make debug_init        # start openocd gdb server
$ make debug             # connect to gdb target and begin debugging
$ make disasm            # generate a .lss file that contains disassembly
                           of the compiled file interspersed with your
                           original source code.
$ make generate_assembly # generate a .s file containing the compiler
                           generated assembly of the main sketch.
$ make size              # show the size of the compiled output (relative to
                           resources, if you have a patched avr-size).
$ make symbol_sizes      # generate a .sym file containing symbols and their
                           sizes.
$ make verify_size       # verify that the size of the final file is less than
                           the capacity of the micro controller.
$ make tags              # generate tags file including project libs and Arduino core
```

### Board Tools

```
make burn_bootloader   # burn bootloader and fuses
make reset             # reset the Arduino by tickling DTR or changing baud
                         rate on the serial port.
make set_fuses         # set fuses without burning bootloader
```



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

----

[&laquo; Installation](Installation.md) // [&ldca; Getting Started](GettingStarted.md) //  [^Table of Contents^](#table-of-contents) // [Configuration &raquo;](Configuration.md)
