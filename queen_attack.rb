require './grid_validation'

class Queens

  GRID_SIZE = 8

  def initialize(white:[],black:[])
    @white = white
    @black = black
    GridValidation.new(GRID_SIZE,@white,@black)
    @w_row,@w_col = @white
    @b_row,@b_col = @black
  end

  def attack?
    on_straight_line? || on_diagnal_line?
  end

  private

  def on_straight_line?
    @w_row == @b_row || @w_col == @b_col
  end

  def on_diagnal_line?
    (@w_row - @b_row).abs == (@w_col - @b_col).abs
  end

end
