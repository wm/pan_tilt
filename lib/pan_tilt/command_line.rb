module PanTilt
  class CommandLine
    def initialize(debug=false)
      @debug      = debug
      @rotor      = PanTilt::Rotor.new @debug
      @pan_angle  = PanTilt::MIN_PAN_ANGLE
      @tilt_angle = PanTilt::MIN_TILT_ANGLE
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
          end
        when PanTilt::RIGHT_ARROW
          if @pan_angle < PanTilt::MAX_PAN_ANGLE
            @pan_angle = @pan_angle + PanTilt::INCREMENT
          end
        when PanTilt::DOWN_ARROW
          if @tilt_angle > PanTilt::MIN_TILT_ANGLE
            @tilt_angle = @tilt_angle - PanTilt::INCREMENT
          end
        when PanTilt::UP_ARROW
          if @tilt_angle < PanTilt::MAX_TILT_ANGLE
            @tilt_angle = @tilt_angle + PanTilt::INCREMENT
          end
        end

        @rotor.rotate @pan_angle, @tilt_angle
      end
    end

    private

    def print_instructions
      puts "Use 'h', 'j', 'k', and 'l' to pan and tilt. Use 'e' to exit"
    end
  end
end
