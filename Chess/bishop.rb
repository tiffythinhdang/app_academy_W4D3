require_relative "piece"
require_relative "slide"

class Bishop < Piece
  include Slideable

  def symbol
    @symbol = :B
  end

  def move_dirs  
    self.diagonal_dirs
  end

end