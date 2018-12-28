[&laquo; Installation](Installation.md)  // [&ldca; Getting Started](GettingStarted.md) // [Configuration &raquo;](Configuration.md)

>error `make: *** No rule to make target \`help'.` 
> RGBWstrandtest.ino:49:3: error: 'whiteOverRainbow' was not declared in this scope

- Since it doesn't do any pre processing like Arduino IDE, you have to declare all methods before you use them ([issue #59](https://github.com/sudar/Arduino-Makefile/issues/59))
