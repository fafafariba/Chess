

class Piece
  attr_reader :value
  attr_accessor :selected, :color

  def initialize(value, board, color = nil)
    @value = value
    @board = board
    @selected = false
    #WADE vv
    @color = color
  end

  def legal_moves(start_pos)
    move_helper(start_pos)
    # moves contains list of end positions
  end

  def move_helper(end_pos)

  end
end
