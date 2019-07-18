require_relative "piece"
require_relative "king"
require_relative "rook"
require_relative "queen"
require_relative "bishop"
require_relative "knight"
require_relative "pawn"
require "byebug"
class Board

  attr_reader :board


  def initialize
    @board = Array.new(8) {Array.new(8)}
  end

  def add_pieces
    #add Kings
    self[[7, 3]] = King.new(:W, self, [7, 3])
    self[[0, 3]] = King.new(:B, self, [0, 3])

    #add Queens
    self[[7, 4]] = Queen.new(:W, self, [7, 4])
    self[[0, 4]] = Queen.new(:B, self, [0, 4])

    #add Knights
    self[[7, 1]] = Knight.new(:W, self, [7, 1])
    self[[7, 6]] = Knight.new(:W, self, [7, 6])
    self[[0, 1]] = Knight.new(:B, self, [0, 1])
    self[[0, 6]] = Knight.new(:B, self, [0, 6])

    #add Bishops
    self[[7, 2]] = Bishop.new(:W, self, [7, 2])
    self[[7, 5]] = Bishop.new(:W, self, [7, 5])
    self[[0, 2]] = Bishop.new(:B, self, [0, 2])
    self[[0, 5]] = Bishop.new(:B, self, [0, 5])

    #add Rooks
    self[[7, 0]] = Rook.new(:W, self, [7, 0])
    self[[7, 7]] = Rook.new(:W, self, [7, 7])
    self[[0, 0]] = Rook.new(:B, self, [0, 0])
    self[[0, 7]] = Rook.new(:B, self, [0, 7])

    #add Pawns
    (0..7).each do |col|
      @board[1][col] = Pawn.new(:B, self, [1, col])
      @board[6][col] = Pawn.new(:W, self, [6, col])
    end
    
    #add Nullpiece
    (2..5).each do |row|
      (0..7).each do |col|
        pos = [row, col]
        self[pos] = NullPiece.instance
      end
    end 
  end

  def move_piece(start_pos, end_pos)
    current_piece = self[start_pos]

    if current_piece.is_a?(NullPiece)
      raise "No piece there!"
    elsif !current_piece.moves.include?(end_pos)
      raise "Can't move the piece there"
    else
      self[end_pos] = self[start_pos]
      self[start_pos] = NullPiece.instance
    end
  end

  def [](pos)
    row, col = pos
    @board[row][col]

  end

  def []=(pos, value)
    row, col = pos
    @board[row][col] = value 
  end
end

# # board1 = Board.new()
# board1.add_pieces
# # board1.render
# # p board1[[6,3]].moves
# # board1.move_piece([1,0], [2,0])

# # board1[[1,0]] = NullPiece.instance

