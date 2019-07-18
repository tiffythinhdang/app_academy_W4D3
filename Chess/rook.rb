require_relative "piece"
require_relative "slide"

class Rook < Piece
  include Slideable

  def symbol
    @symbol = :R
  end

  def move_dirs  
    self.horizontal_dirs
  end

end