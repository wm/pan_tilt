require "pan_tilt/version"

require 'bundler/setup'
require 'dino'
require 'io/console'

module PanTilt
  ESCAPE         = 'e'
  LEFT_ARROW     = 'h'
  RIGHT_ARROW    = 'l'
  UP_ARROW       = 'k'
  DOWN_ARROW     = 'j'
  MAX_TILT_ANGLE = 135
  MAX_PAN_ANGLE  = 180
  MIN_TILT_ANGLE = 15
  MIN_PAN_ANGLE  = 0
  INCREMENT      = 5

  board      = Dino::Board.new(Dino::TxRx::Serial.new)
  tilt_servo = Dino::Components::Servo.new(pin: 9, board: board)
  pan_servo  = Dino::Components::Servo.new(pin: 11, board: board)

  pan_angle  = MIN_PAN_ANGLE
  tilt_angle = MIN_TILT_ANGLE

  def self.run
    while key = STDIN.getch
      case key
      when ESCAPE
        break
      when LEFT_ARROW
        if pan_angle > MIN_PAN_ANGLE
          pan_angle = pan_angle - INCREMENT
          pan_servo.position = pan_angle
        end
      when RIGHT_ARROW
        if pan_angle < MAX_PAN_ANGLE
          pan_angle = pan_angle + INCREMENT
          pan_servo.position = pan_angle
        end
      when DOWN_ARROW
        if tilt_angle > MIN_TILT_ANGLE
          tilt_angle = tilt_angle - INCREMENT
          tilt_servo.position = tilt_angle
        end
      when UP_ARROW
        if tilt_angle < MAX_TILT_ANGLE
          tilt_angle = tilt_angle + INCREMENT
          tilt_servo.position = tilt_angle
        end
      end
      puts "p: #{pan_angle}, t: #{tilt_angle}"
    end
  end
end
