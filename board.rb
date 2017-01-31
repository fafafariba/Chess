require_relative 'piece'
require_relative 'null_piece'

class Board

  # https://en.wikipedia.org/wiki/Chess_symbols_in_Unicode
  # Cotains Chess piece unicode

  # PIECE_TYPES = ["\u2656", "\u2658", "\u2657", "\u2655",
  #               "\u2654", "\u2657", "\u2658", "\u2656"] #might move this later

  # Black pieces VV
  PIECE_TYPES = ["\u265C", "\u265E", "\u265D", "\u265B",
                "\u265A", "\u265D", "\u265E", "\u265C"]

  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, ".") }
    populate
  end

  def populate
    @grid = @grid.map.with_index do |row, row_num|
      row.map.with_index do |el, col_num|
        if row_num.between?(2, 5)
          el = NullPiece.instance
        elsif row_num == 6
          el = Piece.new("\u265F", self, :red)
        elsif row_num == 1
          el = Piece.new("\u265F", self, :blue)
        elsif row_num == 0
          el = Piece.new(PIECE_TYPES[col_num], self, :blue)
        else
          el = Piece.new(PIECE_TYPES.reverse[col_num], self, :red)
        end
      end
    end
  end

  def move_piece(start_pos, end_pos)

    valid_move?(start_pos, end_pos)
    #update
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]

  # rescue ArgumentError => e
  #   puts e.message
  #   retry
  # rescue RangeError => e
  #   puts e.message
  #   retryq
  # ensure
  #   puts "YOU MOVED!"
  end

  def valid_move?(start_pos, end_pos)
    if !end_pos[0].between?(0, 7)
      raise RangeError.new("End posiiton row out of bounds!")
    elsif !end_pos[1].between?(0, 7)
      raise RangeError.new("End position col out of bounds!")
    elsif !start_pos[0].between?(0, 7)
      raise RangeError.new("Start posiiton row out of bounds!")
    elsif !start_pos[1].between?(0, 7)
      raise RangeError.new("Start posiiton col out of bounds!")
    elsif self[start_pos].value == " "
      raise ArgumentError.new("Starting position empty!")
    end
  end

  def in_bounds?(pos)
    pos.all? { |coord| coord.between?(0,7) }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

end

new_board = Board.new
new_board.display
puts "------------------------"
new_board.move_piece([1,1], [2,2])
new_board.display
