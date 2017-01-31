require_relative 'board'

module SlidingPiece

  # H_DELTAS = [
  #   [0, -1],
  #   [0, 1]
  # ]
  #
  # V_DELTAS = [
  #   [-1, 0],
  #   [1, 0]
  # ]
  #
  # D_DELTAS = [
  #   [1,1],
  #   [1,-1],
  #   [-1,1],
  #   [-1,-1]
  # ]

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
      [1,1],
      [1,-1],
      [-1,1],
      [-1,-1]
    ]
  }

  def move_helper_with_direction(start_pos, dirs)
    moves = []
    dirs.each do |direction|
      move_generator(start_pos, direction)
      moves.delete(start_pos)
  end

  def move_generator(start_pos, direction)
    result = []

    DELTAS[direction].each do |delta|
      pos = start_pos
      pos = [start_pos[0] + delta[0], start_pos[1] + delta[1]]
      while @board.in_bounds?(pos) && @board[pos].color != @color
        result << pos
        if @board[pos].color != @color
          break
        end
        pos = [start_pos[0] + delta[0], start_pos[1] + delta[1]]
      end
    end
    result
  end

  def horizontal(start_pos, deltas)
    result = []

    H_DELTAS.each do |delta|
      pos = start_pos
      pos = [start_pos[0]+delta[0], start_pos[1] + delta[1]]
      while @board.in_bounds?(pos) && @board[pos].color != @color
        result << pos
        if @board[pos].color != @color
          break
        end
        pos = [start_pos[0]+delta[0], start_pos[1] + delta[1]]
      end
    end
    result
  end

  def diagonal(start_pos)
    result = []

    D_DELTAS.each do |delta|
      pos = start_pos
      pos = [start_pos[0]+ delta[0], start_pos[1] + delta[1]]
      while @board.in_bounds?(pos) && @board[pos].color != @color
        result << pos
        if @board[pos].color != @color
          break
        end
        pos = [start_pos[0]+delta[0], start_pos[1] + delta[1]]
      end
    end

    result
  end

  def vertical(start_pos)
    result = []

    V_DELTAS.each do |delta|
      pos = start_pos
      pos = [start_pos[0] + delta[0], start_pos[1] + delta[1]]
      while @board.in_bounds?(pos) && @board[pos].color != @color
        result << pos
        if @board[pos].color != @color
          break
        end
        pos = [start_pos[0] + delta[0], start_pos[1] + delta[1]]
      end
    end
    result
  end

end
