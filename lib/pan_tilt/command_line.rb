module PanTilt
  class CommandLine
    attr_reader :board, :tilt_servo, :pan_servo

    def initialize(debug=true)
      @debug      = debug

      @pan_angle  = PanTilt::MIN_PAN_ANGLE
      @tilt_angle = PanTilt::MIN_TILT_ANGLE

      @board      = Dino::Board.new(Dino::TxRx::Serial.new)
      @tilt_servo = Dino::Components::Servo.new(pin: 9,  board: @board)
      @pan_servo  = Dino::Components::Servo.new(pin: 11, board: @board)
    end

    def run
      print_instructions

      while key = STDIN.getch
        case key
        when PanTilt::ESCAPE
          break
        when PanTilt::LEFT_ARROW
          if @pan_angle > PanTilt::MIN_PAN_ANGLE
            @pan_angle = @pan_angle - PanTilt::INCREMENT
            pan_servo.position = @pan_angle
          end
        when PanTilt::RIGHT_ARROW
          if @pan_angle < PanTilt::MAX_PAN_ANGLE
            @pan_angle = @pan_angle + PanTilt::INCREMENT
            pan_servo.position = @pan_angle
          end
        when PanTilt::DOWN_ARROW
          if @tilt_angle > PanTilt::MIN_TILT_ANGLE
            @tilt_angle = @tilt_angle - PanTilt::INCREMENT
            tilt_servo.position = @tilt_angle
          end
        when PanTilt::UP_ARROW
          if @tilt_angle < PanTilt::MAX_TILT_ANGLE
            @tilt_angle = @tilt_angle + PanTilt::INCREMENT
            tilt_servo.position = @tilt_angle
          end
        end

        print_debug "p: #{@pan_angle}, t: #{@tilt_angle}"
      end
    end

    private

    def print_debug(string)
      string if @debug
    end

    def print_instructions
      puts "Use 'h', 'j', 'k', and 'l' to pan and tilt. Use 'e' to exit"
    end
  end
end
