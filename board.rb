


# Your code here

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
  board[0].replace(columns)
  #board_size[0].map! do |cell|
  #  cell = "A"
end

def board_rows
  i = 0
  board_size.each do |row|
    row[0] = integer(i)
    i += 1
  end
end

def board
  board_rows << board_columns
end

def integer(number)
  if number == 10
    number.to_s
  else
    number.to_s + " "
  end
end

def board_visualization
  board.each

def both_board_visualations
  over_all_game_board.each do |board|
    p board
  end
end

#both boards
def over_all_game_board
  both_boards_array = board * 2
end

#p board_columns
#
#board
board_visualations[0]
board_visualations[1]








#DRIVER CODE

# board_size

