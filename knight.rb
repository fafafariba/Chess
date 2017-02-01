require_relative 'step_piece_mod'
require_relative 'piece'
require_relative 'board'
require_relative 'display'

class Knight < Piece
  include SteppingPiece

  def initialize(color, position, board)
    @value = "\u265E"
    @position = position
    @color = :blue
    @board = board
    # super(color)
  end
end
