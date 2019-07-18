require "byebug"

module Stepable

  def moves
    poss_dirs = self.move_diffs
    current_pos = self.pos
    poss_pos = []
    poss_dirs.each do |dir|
      dx, dy = dir
      x, y = current_pos
      new_pos = [x + dx, y + dy]
      end_piece = board[new_pos]
      if end_piece.is_a?(NullPiece) || (end_piece.color != self.color)
        poss_pos << new_pos
      end
    end
    new_poss = poss_pos.select do |pos| 
      (pos[0] >= 0 && pos[0] < 8) && (pos[1] >= 0 && pos[1] < 8) 
    end
  end

  def move_diffs
    raise NotImplementedError
  end
end