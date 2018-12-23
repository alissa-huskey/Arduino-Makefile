# Usage


**Table of Contents**
<!-- Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc.go) -->

  * [Using Make](#using-make)
  * [Use Case Examples](#use-case-examples)
  * [Master Makefiles](#master-makefiles)
  * [Setting Variables](#setting-variables)
  * [Variables](#variables)
    * [Basic Variables](#basic-variables)
    * [Libraries](#libraries)
    * [avrdude](#avrdude)
    * [Arduino ARM Boards](#arduino-arm-boards)
    * [Tool Integration](#tool-integration)
      * [Colorgcc](#colorgcc)
      * [Emacs/Flymake support](#emacsflymake-support)
      * [Code:Blocks integration](#codeblocks-integration)


## Using Make

To see all of the commands (or make targets) available:

```sh
make help | less # use arrows to scroll, q to exit
```

To see a detailed list of available parameters and their meanings:

```sh
make help_vars | less # use arrows to scroll, q to exit
```

Note: if you see the error `make: *** No rule to make target \`help'.` it is because you have no Makefile in the current directory.

## Use Case Examples

In the examples directory, you will find a number of projects that demonstrate various usage patterns. Each project includes a Makefile that you can look at to learn how to configure that particular use case or copy as a template.

For example, `ATtinyBlink` shows you how to set up your Makefile if you use a different core (board platform) like ATtiny.

```
cd "$ADMK_DIR/examples/ATtiny"
less Makefile   # use arrows to scroll, q to quit
```

You can also build example projects and upload them to your boards to test if things are working.

```
make && make upload
```

The master Makefile itself is a resource with detailed comments that you can browse to learn more.
```
less "$ADMK_DIR/Arduino.mk"
```

## Master Makefiles

Arduino-Makefile provides a number of master Makefiles for you to include in your projects `Makefile`.

- Arduino.mk -- Makefile for Arduino AVR boards.
- OpenCM.mk -- Makefile for Robotis OpenCM boards.
- Sam.mk -- Makefile for Arduino Atmel SAM boards (sam and samd)
- Teensy.mk -- Makefile for Teensy 3.x boards.
- chipKIT.mk -- Makefile for systems using the chipKit development platform.

## Setting Variables

Variable defaults are set in `$ADMK_DIR/Arduino.mk`. 

Variables can be set in your Makefile.

```make
# <PROJECT PATH>/Makefile
BOARD_SUB         = atmega2560
```

They can be set as envionment variables stored in your .bashrc or .bash_profile. 

```make
# $HOME/.bashrc
export MONITOR_PORT="/dev/ttyACM0"
```

They can be set as envionment variables stored in your .bashrc or .bash_profile. 

```make
# $HOME/.bashrc
export MONITOR_PORT="/dev/ttyACM0"
```

## Variables

Arduino-Makefile provides the master `Arduino.mk` file for you to include in your projects `Makefile`. You can then override its variables to suit the needs of your system and project.

### Basic Variables

- `BOARD_TAG` - Type of board, for a list see boards.txt or `make show_boards`. Defaults to `uno`.
- `MONITOR_PORT` - The port where your Arduino is plugged in, usually `/dev/ttyACM0` or `/dev/ttyUSB0` in Linux or Mac OS X and `com3`, `com4`, etc. in Windows. Arduino-Makefile will attempt to detect your port and set it.
- `ARDUINO_DIR` - Path to Arduino IDE installation. Arduino-Makefile will look in the default install paths for each platform and set it if found.
- `ARDMK_DIR`   - Path where the master `*.mk` files are located. If you installed the package, then it is usually `/usr/share/arduino`.
- `AVR_TOOLS_DIR` - Path where the avr tools chain binaries are located. Defaults to the tools bundled with your Arduino IDE (1.5+). Set to relative and not absolute. <!-- QUESTION: Is this true? -->


Note: On Windows paths should use Unix-style forward slashes `/` and not Windows-style back slashes `\\`.
For example `C:/Arduino` not `C:\\Arduino`.

The complete list of variables is available at [Variables](arduino-mk-vars.md) file or by running `make help_vars`


### Libraries

You can specify space separated list of libraries that are needed for your sketch in the variable `ARDUINO_LIBS`.

```make
	ARDUINO_LIBS = Wire SoftwareSerial
```

The libraries will be searched for in the following places in the following order.

- `/libraries` directory inside your sketchbook directory. Sketchbook directory will be auto detected from your Arduino preference file. You can also manually set it through `ARDUINO_SKETCHBOOK`.
- `/libraries` directory inside your Arduino directory, which is read from `ARDUINO_DIR`.

The libraries inside user directories will take precedence over libraries present in Arduino core directory.

The makefile can autodetect the libraries that are included from your sketch and can include them automatically. But it can't detect libraries that are included from other libraries. (see [issue #93](https://github.com/sudar/Arduino-Makefile/issues/93))

### avrdude

To upload compiled files, `avrdude` is used. This Makefile tries to find `avrdude` and it's config (`avrdude.conf`) below `ARDUINO_DIR`. If you like to use the one installed on your system instead of the one which came with Arduino, you can try to set the variables `AVRDUDE` and `AVRDUDE_CONF`. On a typical Linux system these could be set to

```make
      AVRDUDE      = /usr/bin/avrdude
      AVRDUDE_CONF = /etc/avrdude.conf
```

### Arduino ARM Boards

For Arduino boards using ARM architechure, specifically the Atmel SAM series
((SAM3X8E) Due; (SAMD21) Arduino M0 [Pro], Zero, MKR1000, Feather M0, etc.), first
install the board support package from the IDE or other distribution channels.

Define`ARDUINO_PACKAGE_DIR` as the root path containing the ARM support
package (the manufacturer folder) and the `BOARD_TAG` (see `make show_boards`
for help) within your project Makefile. Include 'Sam.mk' rather than
  'Arduino.mk' at the end of your file - see examples/ZeroBlink,
  examples/MZeroBlink and examples/DueBlink for example usage.

**Note**: The Arduino IDE does not install board support packages to
the base Arduino installation directory (the directory that will work with AVR
Makefiles). They are generally installed to a '.arduino15/packages' folder in
the users home directory. This is the reason for the new `ARDUINO_PACKAGE_DIR`
define. On Windows, the package directory is often in the user home directory
so advice is to create a symblic link to avoid slash/space in path problems.
You can also manually install support packages in your Sketchbook 'hardware'
folder, then define ARDUINO_PACKAGE_DIR as this path.

If using a SAM board from a manufacturer other than Arduino, one must still
install the Arduino board support as above (unless using externally defined
toolchain) and then define the location of the manufacturer board support core
using the ALTERNATIVE_CORE_PATH define. For example: `ALTERNATE_CORE_PATH =
$(ARDUINO_SKETCHBOOK)/hardware/sparkfun/samd`

The programing method will auto-detect based on the `BOARD_TAG` settings read
from boards.txt:

Programming using OpenOCD CMSIS-DAP with the Programming/debug USB is
currently supported (the same method used by the IDE), including burning
bootloaders. External CMSIS tools such as Atmel Ice will also work with this
method. Black Magic Probe (BMP) support is also included using GDB for both
uploading and debugging.

Native USB programing using Bossa (Due, Zero, MKR1000, Feather style bootloaders)
and avrdude (M0 bootloaders) is supported. The bootloaders on these devices
requires a double press of the reset button or open/closing the serial port at
1200 BAUD. The automatic entry of the bootloader is attempted using
`ard-reset-arduino` when using the general `make upload` target by polling
attached devices until the bootloader port re-attaches (same method as the
IDE). On Windows, the USB enumerates as differnt COM ports for the CDC Serial
and bootloader and these must be defined. On encountering problems, one can
manually enter the bootloader then upload using the `make raw_upload` target.
Note that the `make reset` target will enter the bootloader on these devices;
there is no way to reset over USB.

If using system installed tools, be aware that `openocd` and `bossa` were
orginally forked for Arduino support and system distributions may not be up
to date with merged changes. `bossa` must be version 1.7->. `openocd` should
work but there may be problems at run time
[ref](https://github.com/pda/arduino-zero-without-ide). Ideally, use the
support packaged version or compile and install the Arduino fork.

With the ARM chipset and using a CMSIS-DAP tool, on-device debugging is made available:

* `debug_init` and `debug` targets for on-device debugging using GDB. To use
  this, one must start the GDB server with `make debug_init &`, followed by
  connecting to the target with `make debug`. If using a Black Magic Probe,
  one can just use `make debug`. At the moment, a system wide `arm-none-eabi-gdb` must be
  installed as the one supplied with the Arduino toolchain
  does not appear to work. 
* Example usage: https://asciinema.org/a/Jarz7Pr3gD6mqaZvCACQBzqix
* See the examples/MZeroBlink Makefile for a commented example.

### Tool Integration

#### Colorgcc

It is possible to use [`colorgcc`](https://github.com/colorgcc/colorgcc) with this makefile. Check out [this comment](http://hardwarefun.com/tutorials/compiling-arduino-sketches-using-makefile#comment-1408) to find usage instructions.

#### Emacs/Flymake support

On-the-fly syntax checking in Emacs using the [Flymake](http://www.emacswiki.org/emacs/FlyMake) minor mode is now possible.

First, the flymake mode must be configured to recognize ino files :

Edit the flymake configuration :

```
    M-x customize-option RET
    flymake-allowed-file-name-masks RET
```

Add the line :

```
      ("\\.ino\\'" flymake-simple-make-init)
```

Then click on "Apply and Save" button

Then, the following line must be added to the project Makefile :

```make
    check-syntax:
        $(CXX) -c -include Arduino.h   -x c++ $(CXXFLAGS)   $(CPPFLAGS)  -fsyntax-only $(CHK_SOURCES)
```

#### Code:Blocks integration

In Code:Blocks open Project -> Properties -> Project settings tab -> check "This is custom Makefile".

Now go to Settings -> Environment -> Environment variables -> Add

Add three keys with paths as values, using full paths (!):

```make
	ARDUINO_DIR=/full/path/to/arduino-1.0.6
	ARDMK_DIR=/full/path/to/sketchbook
	AVR_TOOLS_DIR=/usr
```

Now to set DEBUG target (this will compile the project) go to Build options -> Debug -> "Make" commands

In Build Project/Target remove $target:

```sh
$make -f $makefile
```

In Clean Project/Target remove $target:

```sh
$make -f $makefile clean
```

To set the RELEASE target (which will compile and upload) go to Build options -> Release -> "Make" commands

In Build Project/Target put:

```sh
$make -f $makefile upload
```

In Clean Project/Target remove $target:

```sh
$make -f $makefile clean
```

