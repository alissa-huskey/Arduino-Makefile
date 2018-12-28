# A Makefile for Arduino Sketches [![Build Status](https://travis-ci.org/sudar/Arduino-Makefile.svg)](https://travis-ci.org/sudar/Arduino-Makefile)

This is a very simple Makefile which knows how to build Arduino sketches. It defines entire workflows for compiling code, flashing it to Arduino and even communicating through Serial monitor. You don't need to change anything in the Arduino sketches in most cases.

#### Table of Contents
<!--- Created by [github-markdown-toc](https://github.com/ekalinin/github-markdown-toc.go) -->

  * [Features](#features)
  * [Usage](#usage)
  * [Installation](#installation)
  * [Versioning](#versioning)
  * [License](#license)
  * [Contribution](#contribution)
  * [Limitations / Known Issues / TODO's](#limitations--known-issues--todos)
  * [Test Suite](#test-suite)
  * [Credits](#credits)
  * [Similar works](#similar-works)

## Features

- Very robust
- Highly customizable
- Supports all official AVR-based Arduino boards
- Supports official ARM-based Arduino boards using Atmel SAM chip family
and includes on-device debugging targets.
- Supports chipKIT
- Supports Teensy 3.x (via Teensyduino)
- Works on all three major OS (Mac, Linux, Windows)
- Auto detects serial baud rate and libraries used
- Support for `*.ino` and `*.pde` sketches as well as raw `*.c` and `*.cpp`
- Support for Arduino Software versions 0.x, 1.0.x, 1.5.x and 1.6.x except 1.6.2.
We recommend 1.6.3 or above version of Arduino IDE.
- Automatic dependency tracking. Referred libraries are automatically included
in the build process. Changes in `*.h` files lead to recompilation of sources which include them

## Usage

## Installation

### Requirements

## Versioning

The current version of the makefile is `1.6.0`. You can find the full history in the [HISTORY.md](HISTORY.md) file

This project adheres to Semantic [Versioning 2.0](http://semver.org/).

## License

This makefile and the related documentation and examples are free software; you can redistribute it and/or modify it
under the terms of the GNU Lesser General Public License as
published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

## Contribution

All contributions (even documentation) are welcome :) Open a pull request and I would be happy to merge them.
Also checkout the [contribution guide](CONTRIBUTING.md) for more details.

If you are looking for ideas to work on, then check out the following TODO items or the [issue tracker](https://github.com/sudar/Arduino-Makefile/issues/).

## Limitations / Known Issues / TODO's

- Since it doesn't do any pre processing like Arduino IDE, you have to declare all methods before you use them ([issue #59](https://github.com/sudar/Arduino-Makefile/issues/59))
- More than one .ino or .pde file is not supported yet ([issue #49](https://github.com/sudar/Arduino-Makefile/issues/49))
- When you compile for the first time, it builds all libs inside Arduino directory even if it is not needed. But while linking only the relevant files are linked. ([issue #29](https://github.com/sudar/Arduino-Makefile/issues/29)). Even Arduino IDE does the same thing though.
- This makefile doesn't support boards or IDE from Arduino.org.

If you find an issue or have an idea for a feature then log them in the [issue tracker](https://github.com/sudar/Arduino-Makefile/issues/)

## Test Suite

This project includes a suite of example Makefiles and small Arduino and chipKIT
programs to assist the maintainers of the Makefile. Run
`tests/script/bootstrap.sh` to attempt to automatically install the dependencies
(Arduino IDE, MPIDE, etc.). Run `tests/script/runtests.sh` to attempt to compile
all of the examples. The bootstrap script is primarily intended for use by a
continuous integration server, specifically Travis CI. It is not intended for
normal users.

## Credits

This makefile was originally created by [Martin Oldfield](http://mjo.tc/atelier/2009/02/arduino-cli.html) and he maintained it till v0.10.2.
From May 2013, it is maintained by [Sudar Muthu](http://hardwarefun.com/tutorials/compiling-arduino-sketches-using-makefile) and [Simon John](https://github.com/sej7278) with the help of [40+ contributors](https://github.com/sudar/Arduino-Makefile/graphs/contributors).

## Similar works
- It's not a derivative of this, but Alan Burlison has written a [similar thing](http://bleaklow.com/2010/06/04/a_makefile_for_arduino_sketches.html).
- Alan's Makefile was used in a [Pragmatic Programmer's article](http://pragprog.com/magazines/2011-04/advanced-arduino-hacking).
- Rei Vilo wrote to tell me that he's using the Makefile ina Xcode 4 template called [embedXcode](http://embedxcode.weebly.com/). Apparently it supports many platforms and boards, including AVR-based Arduino, AVR-based Wiring, PIC32-based chipKIT, MSP430-based LaunchPad and ARM3-based Maple.
