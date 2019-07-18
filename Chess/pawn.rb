require_relative "piece"

class Pawn < Piece

  def symbol
    @symbol = :P
  end

  def moves
    forward_steps + side_attacks
  end

  private

  def at_start_row?
    if color == :W 
      pos[0] == 6
    else
      pos[0] == 2
    end
  end

  def forward_dir
    if color == :W
      [-1, 0]
    else
      [1, 0]
    end
  end

  def forward_steps
    poss_steps = [forward_dir]
    if at_start_row?
      poss_steps << poss_steps[0].map{ |n| n * 2 }
    end
    poss_steps.map! do |diff| 
      dx, dy = diff  
      x, y = pos
      [dx + x, dy + y] 
    end
  end

  def side_attacks
    attk_dir = {
      B:[[1, 1], [1, -1]],
      W:[[-1,-1], [-1, 1]]
    }
    poss_attk_dir = (color == :W ? attk_dir[:W] : attk_dir[:B] )


    poss_attk = poss_attk_dir.map do |diff| 
      dx, dy = diff  
      x, y = pos
      [dx + x, dy + y] 
    end

    poss_attk.select! do |attk_pos|
      new_piece = board[attk_pos]
      color != new_piece.color && !new_piece.is_a?(NullPiece)
    end
  end

end