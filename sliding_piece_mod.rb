module SlidingPiece
  DELTAS = {
    horiz: [
      [0, -1],
      [0, 1]
    ],
    vert: [
      [-1, 0],
      [1, 0]
    ],
    diag: [
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1]
    ]
  }

  def moves
    possible_moves = []
    @directions.each do |direction|
     result = move_generator(direction)
      possible_moves += result unless result.empty?
    end
    possible_moves
  end

  def move_generator(direction)
    result = []

    DELTAS[direction].each do |delta|
      pos = [@position[0] + delta[0], @position[1] + delta[1]]
      while @board.in_bounds?(pos) && @board[pos].color != @color
        result << pos
        if @board[pos].color != @color && !@board[pos].color.nil?
          break
        end
        pos = [pos[0] + delta[0], pos[1] + delta[1]]
      end
    end
    p "#{direction} #{result}"
    result
  end

end
