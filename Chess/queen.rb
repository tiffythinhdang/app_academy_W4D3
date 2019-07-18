require_relative "piece"
require_relative "slide"

class Queen < Piece
  include Slideable

  def symbol
    @symbol = :Q
  end

  def move_dirs  
    self.horizontal_dirs.concat(self.diagonal_dirs)
  end

end