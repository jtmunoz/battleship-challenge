

class Board
# Your code here
attr_accessor :board
  def initialize
    @board = []
  end
#creates a board
def board_size
  board_array = Array.new
  11.times { board_array << Array.new(11, " ") }
  board_array
end

def board_columns
  columns =
  ["  ","A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
  board = board_size
  board[0] = (columns)
  #board_size[0].map! do |cell|
  board
end

def board_rows
  i = 0
  board_columns.each do |row|
    row[0] = integer(i)
    i += 1
  end
end

def game_board
  @board =  board_rows
end

def integer(number)
  case number
    when 0
      "  "
    when 10
      number.to_s
    else
    number.to_s + " "
  end
end

def board_visualization
  board.each do |row|
    p row
  end
end

def both_board_visualations
  over_all_game_board.each do |board|
    p board
  end
end

#both boards
def over_all_game_board
  both_boards_array = board * 2
end

end







#DRIVER CODE

# board_size

