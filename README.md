# Pan and Tilt

Pan and tilt your Arduino connected bracket

## Requirements

* Arduino Uno
* USB cable
* Pan/Tilt Bracket from [sparkfun](https://www.sparkfun.com/products/10335)
* 2x Small Servos
* Breadboard
# Pinned wires

## Pan and Tilt bracket
To create the bracket you can order the parts from [sparkfun](https://www.sparkfun.com/products/10335) and follow their [assembly instructions.](https://www.sparkfun.com/datasheets/Robotics/Other/sensor%20pan%20tilt%20manual.jpg)

## Hardware Installation

* Connect the Pan servo's control wire to Pin 11 (configurable)
* Connect the Tilt servo's control wire to Pin 9 (configurable)
* Connect both servos' ground wires to GND
* Connect both servos' power wires to 5V

## Software Installation

* Connect the Arduino to your computer via USB
* Install the [Arduino IDE](http://arduino.cc/en/Main/Software)
* Install this gem

    gem install pan_tilt

## Dino

The [Dino](https://github.com/austinbv/dino) bootstrapper will need to be instaled on the Arduino. You can follow the instructions in [here](https://github.com/austinbv/dino#upload-the-bootstrapper).
The .ino file referenced should be opened and not copied in.
