# Getting Started

If you're new to Arduino-Makefile, this page will tell you what you need to find your way around.

Need to install and set up Arduino-Makefile? [Go here]().

- Install Arduino-Makefile and set up your system
- Learn how to use make and write Makefiles

- Starting a new project
  - Makefile Generator and Project Init
  - Bare-Arduino-Project
- Transitioning an existing project
  - Use Arduino-Makefile as a submodule
- Configuring your Project

## Usage

## Makefile Generator and Project Initialisation

`ardmk-init` within the bin/ folder is a utility Python script to create a
Arduino-mk Makefile for a project and also has option to create a traditional *tree*
organization (src, lib, bin). It can be used as with commandline arguments or
prompted - see examples below (append `$ARDMK_DIR/bin/` to command if not on path):

* Run prompted within current working directory: `ardmk-init`
* Create Arduino Uno Makefile (useful within a library example): `ardmk-init -qb uno`
* Create boilerplate Arduino Uno project in current working directory of same
  name: `ardmk-init -b uno --quiet --project`
* Create Arduino-mk nano Makefile in current working directory with template .ino: `ardmk-init -b nano -u atmega328 -qtn my-project`
* See `ardmk-init --help` for more.

## Bare-Arduino–Project

If you are planning on using this makefile in a larger/professional project, you might want to take a look at the [Bare-Arduino–Project](https://github.com/WeAreLeka/Bare-Arduino-Project) framework.

Similar to HTML frameworks, [Bare-Arduino–Project](https://github.com/WeAreLeka/Bare-Arduino-Project) aims at providing a basic `tree` organization, `Makefile` configurations for both OS X and Linux and a handful of instruction on how to get started with a robust Arduino project architecture.

Further information are available in the [README.md](https://github.com/WeAreLeka/Bare-Arduino-Project/blob/master/README.md) as well as in the [use/installation procedure](https://github.com/WeAreLeka/Bare-Arduino-Project/blob/master/INSTALL.md).

Please be sure to report issues to [Bare-Arduino–Project](https://github.com/WeAreLeka/Bare-Arduino-Project/issues) if you use it instead of this project.
