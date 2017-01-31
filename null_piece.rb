require 'singleton'
require_relative 'piece'

# TODO: if default value for null piece changes, update
# Board#valid_move::68ish

class NullPiece < Piece
  include Singleton

  def initialize
    @value = " "
  end
end
