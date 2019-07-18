require "byebug"

module Slideable

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    # debugger
    poss_dirs = move_dirs.map { |dir| grow_unblocked_moves_in_dir(dir) }
    poss_dirs.inject(:+)
  end

  # private

  HORIZONTAL_DIRS = [
    [0, 1],
    [0, -1],
    [1, 0],
    [-1, 0]
  ]
  DIAGONAL_DIRS =[
    [1, -1],
    [1, 1],
    [-1, -1],
    [-1, 1]
  ]

  def grow_unblocked_moves_in_dir(dir)
    # debugger
    poss_pos = []
    current_pos = self.pos
    dx, dy = dir

    while true
      x, y = current_pos
      new_pos = [x + dx, y + dy]
      break unless new_pos.all? { |value| (0..7).to_a.include?(value) }
      end_piece = board[new_pos]


      if end_piece.color != self.color && !end_piece.is_a?(NullPiece)
        poss_pos << new_pos
        break
      elsif end_piece.color == self.color
        break
      else
        poss_pos << new_pos
      end

      current_pos = new_pos

    end

    poss_pos
  end
end

