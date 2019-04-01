class GridValidation

  def initialize(grid_size=8, *positions)
    @positions = positions
    @grid_size = grid_size
    validate!
  end

  def validate!
    if invalid_argument_type?
      raise ArgumentError.new("Expected arguments to be Array")
    elsif invalid_positions?
      raise ArgumentError.new("Arguments contain invalid position")
    elsif duplicate_positon?
      raise ArgumentError.new("Arguments contain duplicate position")
    end
  end

  def invalid_argument_type?
    @positions.any? { |position| !position.kind_of?(Array) }
  end

  def invalid_positions?
    invalid_position = @positions.any? { |position| position.count != 2 }
    invalid_position ||= @positions.flatten.any? { |point| point.nil? || point < 0 || point >= @grid_size }
    return invalid_position
  end

  def duplicate_positon?
    @positions.uniq != @positions
  end

end
