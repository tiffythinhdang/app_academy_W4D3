# require "colorize"
require_relative "board"
require_relative "cursor"

class Display

  attr_reader :board

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    @cursor
    board.board.each do |row|
      puts row.map(&:symbol).join("   ")
    end
  end
end

board1 = Board.new()
board1.add_pieces
display1 = Display.new(board1)
display1.render