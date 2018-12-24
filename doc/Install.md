[&ldca; Getting Started]() // [Usage &raquo;]()

# Installation Guide

A guide to install and setup Arduino-Makefile including installing its requirements, support for any additional board platforms, and how to verify that things are working.

**Table of Contents**
<!-- Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc.go) -->

  * [System Setup](#system-setup)
  * [Board Platform Support](#board-platform-support)
  * [Test Drive](#test-drive)


## System Setup

For installation and system configuration for major platforms first complete the guide for your OS below then come back here to finish.

* [MacOS](Install-MacOS.md)
* [*Nix Systems](Install-Nix.md)
* [Windows](Install-Windows.md)


## Board Platform Support

All official AVR-based Arduino boards are supported out of the box. If any of your boards use a different architecture, follow the instructions below to install the relevant packages.

### Arduino ARM Boards

For Arduino boards using ARM architecture, specifically the Atmel SAM series ((SAM3X8E) Due; (SAMD21) Arduino M0 [Pro], Zero, MKR1000, Feather M0, etc.), first install the board support package from the IDE or other distribution channels.

To install boards using the Arduino IDE graphical interface, navigate to `Tools` > `Board` > `Boards Manager`.

In Arduino 1.5+ you can use the CLI ([more info](https://github.com/arduino/Arduino/blob/master/build/shared/manpage.adoc)) by running:

```
$ arduino --install-boards <package>:<arch>[:<version>]
```

For example:
```
$ $ARDUINO_DIR/arduino --install-boards arduino:samd
$ $ARDUINO_DIR/../MacOS/Arduino --install-boards arduino:samd  # MacOS
```

### Teensy 3.x

For Teensy 3.x support you must first install [Teensyduino](http://www.pjrc.com/teensy/teensyduino.html).

See examples/BlinkTeensy for example usage.

### Robotis OpenCM

For Robotis OpenCM support you must first install [the OpenCM IDE](http://support.robotis.com/en/software/robotis_opencm/robotis_opencm.htm)

See examples/BlinkOpenCM for example usage.

For large Robotis projects, [libmaple](https://github.com/Rhoban/Maple) may be more appropriate, as the OpenCM IDE uses a very old compiler release.

## Test Drive

To verify that things are working, use the bundled Blink example.

```sh
$ cd $ARDMK_DIR/examples/Blink
$ make
$ make upload # assumes you have an Uno board plugged in
```

[&ldca; Getting Started]() // [Usage &raquo;]()
