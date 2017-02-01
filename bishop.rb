require_relative 'piece'
require 'sliding_piece_mod'

class Bishop < Piece
  include SlidingPiece

  def initialize(color, position)
    @value = "\u265D"
    @position = position
    @directions = [:diag]
    super(color)
  end
end
