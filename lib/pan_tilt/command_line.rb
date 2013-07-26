module PanTilt
  class CommandLine
    def initialize(debug=false)
      options = {
        debug: debug,
        pan_position: PanTilt::PAN_START_POSITION,
        tilt_position: PanTilt::TILT_START_POSITION
      }
      @board = Dino::Board.new(Dino::TxRx::Serial.new)
      @rotor = PanTilt::Rotor.new @board, options
      @led   = Dino::Components::Led.new(pin: PanTilt::LIVE_LED, board: @board)
    end

    def run
      print_instructions
      @led.send :on

      while key = STDIN.getch
        case key
        when PanTilt::ESCAPE
          @led.send :off
          break
        when PanTilt::LEFT_ARROW
          @rotor.rotate_by (- PanTilt::INCREMENT), 0
        when PanTilt::RIGHT_ARROW
          @rotor.rotate_by PanTilt::INCREMENT, 0
        when PanTilt::DOWN_ARROW
          @rotor.rotate_by 0, (- PanTilt::INCREMENT)
        when PanTilt::UP_ARROW
          @rotor.rotate_by 0, PanTilt::INCREMENT
        end
      end
    end

    private

    def print_instructions
      puts "Use 'h', 'j', 'k', and 'l' to pan and tilt. Use 'e' to exit"
    end
  end
end
