module SteppingPiece

  DELTAS = {
    king: [
      [-1, 1],
      [0, 1],
      [1, 1],
      [1, 0],
      [1, -1],
      [0, -1],
      [-1, -1],
      [-1, 0]
  ],
    knight: [
      [-1, 2],
      [1, 2],
      [2, 1],
      [2, -1],
      [1, -2],
      [-1, -2],
      [-2, -1],
      [-2, 1]
    ]
  }

  def moves
    type = (self.class == Knight ? :knight : :king)
    move_generator(type)
  end

  def move_generator(type)
    result = []

    DELTAS[type].each do |delta|
      pos = [@position[0] + delta[0], @position[1] + delta[1]]
      while @board.in_bounds?(pos) && @board[pos].color != @color
        p pos
        result << pos
        if @board[pos].color != @color
          break
        end
        pos = [@position[0] + delta[0], @position[1] + delta[1]]
      end
    end
    result
  end
end
