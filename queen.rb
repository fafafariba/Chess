require_relative 'sliding_piece_mod'
require_relative 'piece'
require_relative 'board'
require_relative 'display'

class Queen < Piece
  include SlidingPiece

  def initialize(color, position, board)
    @value = "\u265B"
    @position = position
    @board = board
    @color = :yellow
    @directions = [:horiz, :vert, :diag]
    #super(color)
  end
end

b = Board.new
display = Display.new(b)
p b[[1,5]].moves.count
display.test_play
