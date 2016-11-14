require_relative 'board'
require_relative 'carrier'

board = Board.new
p board.game_board

boat = Carrier.new
boat.size


board.board.each do |row|
  p row
end


board.board[3][0] = "YSDY"


board.board.each do |row|
  p row
end
