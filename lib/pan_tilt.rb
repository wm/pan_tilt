require "pan_tilt/version"

require 'bundler/setup'
require 'dino'
require 'io/console'
require 'pan_tilt/rotor'

module PanTilt
  TILT_PIN       = 9
  PAN_PIN        = 11
  ESCAPE         = 'e'
  LEFT_ARROW     = 'h'
  RIGHT_ARROW    = 'l'
  UP_ARROW       = 'k'
  DOWN_ARROW     = 'j'
  MAX_TILT_ANGLE = 135
  MAX_PAN_ANGLE  = 160
  MIN_TILT_ANGLE = 15
  MIN_PAN_ANGLE  = 0
  INCREMENT      = 5
end
