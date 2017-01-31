require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    @board.grid.each_with_index do |row, i|
      row.each_with_index do |col, j|
        if [i,j] == @cursor.cursor_pos || @board[[i, j]].selected
          print " #{col.value} ".colorize(:color => col.color, :background => :green)
        else
          #WADE METHOD vv
          background_color = render_checkerboard(i , j)
          print " #{col.value} ".colorize(:color => col.color, :background => background_color)
        end
      end
      print "\n"
    end
  end

  #WADE METHOD vv
  def render_checkerboard(i, j)
    if (i % 2 == 0 && j % 2 == 0) || (i % 2 == 1 && j % 2 == 1)
      return :light_white
    end
  end

  def test_play
    while true
      system('clear')
      render
      @cursor.get_input
    end
  end
end

new_board = Board.new
display = Display.new(new_board)
display.test_play
