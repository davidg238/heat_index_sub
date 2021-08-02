// Copyright 2021 Ekorau LLC

import pubsub
import encoding.json

import color_tft show *
import font show *
import font.x11_100dpi.sans.sans_14_bold as sans_14
import gpio
import pixel_display show *
// import pixel_display.texture show TEXT_TEXTURE_ALIGN_RIGHT TEXT_TEXTURE_ALIGN_CENTER
import pixel_display.true_color show BLACK get_rgb

import .ColorTFT
import spi

topic ::= "cloud:heat_index"

main:
  map := null
  print "wakeup - checking messages"
  pubsub.subscribe topic --blocking=false: | msg/pubsub.Message |
    sender := ?
    if msg.sender.is_device:
      sender = "Device($msg.sender.hardware_id)"
    else:
      sender = "ExternalSystem($msg.sender.external_name)"
    print "Received message '$msg.payload.to_string' from $sender"
    map = json.decode msg.payload
  print "done processing all messages"

  tft := TFT_factory.adafruit_128x128
  tft.background = BLACK
  sans := Font [sans_14.ASCII]
  sans_context := tft.context --landscape --color=(get_rgb 230 230 50) --font=sans

  x :=  5
  y :=  20 + (random 40)

  line1 := tft.text sans_context x y "t/rh: $(map["t"])/$(map["rh"])"
  line2 := tft.text sans_context x y + 20 "hi: $(map["hi"])"
  line3 := tft.text sans_context x y + 40 "$(map["txt"])"

  tft.draw
