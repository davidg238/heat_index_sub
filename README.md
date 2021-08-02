## Introduction

This code is derived from [Toit](https://toit.io/) sample code:
- [Communicate through the cloud](https://docs.toit.io/platform/tutorials/pubsub/pubsubext)
- [Color TFT](https://github.com/toitware/toit-color-tft)

Please refer to their respective licenses.
## Wiring 

From the ESP32_Core_board_V2 (aka ESP32-DevKitC) to the TFT display.  

| ESP32-DevKitC Pin | Adafruit TFT Pin | Description | 
|:-----------------:|:----------------:|:-----------:|
| 5V  | Vin | 5v power |
|     | 3v3 | not connected (n/c) |
| GND | Gnd | GND |
|  IO19 | SCK | clock
|  IO23 | S0  | miso
|  IO25 | SI  | mosi
|  IO22 | TCS | touchscreen chip select
|  IO18 | RST | reset
|  IO21 | D/C | data/command
|     | CCS | n/c
|   IO5 | Lite | backlight

## Known Issues

1) Jank on the bottom row of the display
2) As at 2021 Aug 01, using an Alpha firmware version v1.2.0-pre.127+ from Toit in the subscriber device. There is a bug in the v1.1.3 firmware, related to the display driver, causing a compilation error.