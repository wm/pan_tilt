module PanTilt
  class Rotor
    attr_reader :board, :tilt_servo, :pan_servo

    def initialize(debug=false)
      @debug      = debug

      @board      = Dino::Board.new(Dino::TxRx::Serial.new)
      @tilt_servo = Dino::Components::Servo.new(pin: 9,  board: @board)
      @pan_servo  = Dino::Components::Servo.new(pin: 11, board: @board)
    end

    def rotate(pan_angle, tilt_angle)
      pan_servo.position = pan_angle
      tilt_servo.position = tilt_angle

      print_debug "p: #{pan_angle}, t: #{tilt_angle}"
    end

    private

    def print_debug(string)
      puts string if @debug
    end
  end
end
