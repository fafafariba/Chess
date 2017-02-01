require_relative 'piece'
require 'sliding_piece_mod'

class Rook < Piece
  include SlidingPiece

  def initialize(color, position)
    @value = "\u265C"
    @position = position
    @directions = [:horiz, :vert]
    super(color)
  end
end
