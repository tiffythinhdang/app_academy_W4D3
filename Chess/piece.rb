require "singleton"

class Piece
  
  attr_reader :color, :board, :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos 
  end

  def inspect
    self.symbol
  end

  def to_s
  end

  def empty?
  end

  def valid_moves
    self.moves || self.move_dirs
  end

  def pos=(val)
    self.pos = val
  end

  def symbol
    @symbol
  end

  private

  def move_into_check?(end_pos)
  end

end

class NullPiece < Piece
  include Singleton
  def initialize
    @color = :A
  end

  # def moves
  # end
  def symbol
    @symbol = "*"
  end
end