# Balance Board

Arduino and Processing code for the Balance Board project

## Table of Contents

- [Balance Board](#balance-board)
  - [Table of Contents](#table-of-contents)
  - [Summary](#summary)
  - [Hardware](#hardware)
  - [Software](#software)
    - [Arduino](#arduino)
    - [Processing](#processing)
      - [Flowchart](#flowchart)
      - [Computing the center of mass](#computing-the-center-of-mass)
      - [Mapping center of mass to the screen](#mapping-center-of-mass-to-the-screen)

## Summary

The Balance Board device consists of a hardware board with a 4x4 load cell configuration (one pair for each corner of the board). The load cells are wired to the Arduino, which reads and sends the sensor data via USB serial to a computer running Processing. The Processing sketch computes the center of mass from the sensor readings, and maps it onto a pixel x and y coordinate. This visualizes the center of mass of the user on the screen. The user can adjust their stance to shift their center of mass on the screen, and complete some assigned task/game.

## Hardware

On each corner of the board, there are two load cells connected to an HX711 amplifier. The name for such a configuration is a wheatstone bridge. Since the Arduino cannot read in voltages greater than 5 volts, we use this configuration so that one load cell acts as a reference voltage, and the difference in voltage between the active load cell and the reference is fed into the amplifier. The amplifier then sends an acceptable voltage to the Arduino.

All load cells must be individually calibrated using a known mass and the example sketch for the load cells.

## Software

### Arduino

The Arduino reads in the load cell values and sends them over USB serial. We must make sure that each load cell reading is **positive**.

### Processing

The Processing code receives the load cell values over USB serial, parses them and visualizes them on the screen.

#### Flowchart

![](bb-architecture@2x.png)

#### Computing the center of mass

Imagine that each corner of the board (a pair of load cells) contributes a single reading. We have four readings:

- `TL`: the top left reading
- `TR`: the top right reading
- `BL`: the bottom left reading
- `BR`: the bottom right reading
- `SUM` = `TL + TR + BL + BR`

We would like to compute the center of mass along the x direction `cX` and the center of mass in the y direction `cY`. We would like each of these to range between [-1.0, 1.0].

For the x direction, imagine that the left and right sides of the boards contribute a vector in that direction.

- `-(TL + BL)` is the vector pointing left
- `+(TR + BR)` is the vector pointing right

Then, `cX` is just the average of the two vectors.

- `cX = (-(TL + BL) + (TR + BR)) / SUM`

Similarly, `cY` is the average of the two vectors pointing up and down.

- `cY = (-(TL + TR) + (BL + BR)) / SUM`

#### Mapping center of mass to the screen

We first start with the physical board.

- `lWidth`: Horizontal distance between the left and right sets of load cells
- `lHeight`: Vertical distance between the top and bottom sets of the load cells
- `ar = lWidth / lHeight`: The aspect ratio of the board

Next, we move onto the Processing sketch, which will be run in `fullScreen()` and will have automatic `width` and `height` variables initialized at runtime.

- `width`: screen width of the Processing sketch
- `height`: screen height of the Processing sketch

To reiterate, we _could_ specify the `width` and `height` using `size()`, but since we use `fullScreen()`, these are automatically assigned.

Next, we compute a bounding box that is of the same aspect ratio as the physical board, contained within our screen.

- `bHeight = magicNumber * height`
- `bWidth = ar * bHeight`

We pick `bHeight` to be some fraction of the height of the screen, and then constrain `bWidth` such that `bWidth` and `bHeight` adhere to the previously calculated aspect ratio. Now we have an imaginary bounding box in our screen.

Next, to map the center of mass, we call the `map()` function to map the `[-1.0, 1.0]` center of mass range to pixels.

- `pixelX = map(cX, -1.0, 1.0, (width / 2) - (bWidth / 2), (width / 2) + (bWidth / 2))`
- `pixelY = map(cY, -1.0, 1.0, (height / 2) - (bHeight / 2), (height / 2) + (bHeight / 2))`
