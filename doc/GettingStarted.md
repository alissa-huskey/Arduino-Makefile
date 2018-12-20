# Getting Started

Let's see if things are working. Navigate to the directory your Arduino-Makefile directory, then we'll make our way to the Blink example and poke around.

```sh
$ cd Arduino-Makefile/examples/Blink
$ ls
Blink.ino  Makefile
```

To see what has already been detected about our system, run:
```sh
$ make help | less
```

You will see a list of the computed configuration, followed by a list of available commands (targets).

Do a test build of the Blink.ino project.
```sh
$ make
```

And upload it to an uno board if you happen to have one handy.
```sh
$ make upload
```

