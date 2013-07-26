module PanTilt
  class Rotor
    attr_reader :board, :tilt_servo, :pan_servo

    def initialize(board, options={})
      @debug      = options[:debug]
      pan_pos     = options[:pan_position]
      tilt_pos    = options[:tilt_position]

      @board      = board
      @tilt_servo = Dino::Components::Servo.new(pin: PanTilt::TILT_PIN, board: @board, position: tilt_pos)
      @pan_servo  = Dino::Components::Servo.new(pin: PanTilt::PAN_PIN, board: @board, position: pan_pos)
    end

    def rotate_by(pan_offset, tilt_offset)
      rotate new_pan_position(pan_offset), new_tilt_position(tilt_offset)
    end

    private

    def new_pan_position(offset)
      current_position = @pan_servo.position
      new_position     = @pan_servo.position + offset

      if new_position.between? PanTilt::MIN_PAN_ANGLE, PanTilt::MAX_PAN_ANGLE
        return new_position
      elsif PanTilt::MIN_PAN_ANGLE.between? new_position, PanTilt::MAX_PAN_ANGLE
        PanTilt::MIN_PAN_ANGLE
      elsif PanTilt::MAX_PAN_ANGLE.between? PanTilt::MIN_PAN_ANGLE, new_position
        PanTilt::MAX_PAN_ANGLE
      end
    end

    def new_tilt_position(offset)
      current_position = @tilt_servo.position
      new_position     = @tilt_servo.position + offset

      if new_position.between? PanTilt::MIN_TILT_ANGLE, PanTilt::MAX_TILT_ANGLE
        return new_position
      elsif PanTilt::MIN_TILT_ANGLE.between? new_position, PanTilt::MAX_TILT_ANGLE
        PanTilt::MIN_TILT_ANGLE
      elsif PanTilt::MAX_TILT_ANGLE.between? PanTilt::MIN_TILT_ANGLE, new_position
        PanTilt::MAX_TILT_ANGLE
      end
    end

    def rotate(pan_angle, tilt_angle)
      pan_servo.position = pan_angle
      tilt_servo.position = tilt_angle

      print_debug "p: #{pan_angle}, t: #{tilt_angle}"
    end

    def print_debug(string)
      puts string if @debug
    end
  end
end
