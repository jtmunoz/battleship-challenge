# Battleship Game

# BOARD SETTING

# Generating New GameBoard:
def generate_board
  Array.new(10) { Array.new(10, 0) }
end

# Coordinate Converter
# Input: User coordinate (Ex: A4)
# Output: row-column based index | false if invalid
def convert_coordinate(user_coordinate)
  index = user_coordinate.split("")
  return false if index.length != 2 # Check length of coordinate inputted

  row_index = index[1].to_i
  return false if !(0..9).include?(row_index) # Check validity of row_index

  col_index = index[0] # Check validity of col_index
  case col_index
  when "A" then col_index = 0
  when "B" then col_index = 1
  when "C" then col_index = 2
  when "D" then col_index = 3
  when "E" then col_index = 4
  when "F" then col_index = 5
  when "G" then col_index = 6
  when "H" then col_index = 7
  when "I" then col_index = 8
  when "J" then col_index = 9
  else
    return false
  end

  [row_index, col_index]
end

# Convert User Board
# Input: Player Board
# Output: User-friendly Player Board
def convert_user_board(board)
  user_board = generate_board
  board.each.with_index do |row, row_index|
    row.map.with_index do |cell, col_index|
      case cell
      when (0..1) then new_cell = " "
      when 2 then new_cell = "x"
      else new_cell = "o"
      end
      user_board[row_index][col_index] = new_cell
    end
  end

  user_board
end

# Convert Opponent Board
# Input: Opponent Board
# Output: User-friendly Opponent Board
def convert_opponent_board(board)
  opponent_board = generate_board
  board.each.with_index do |row, row_index|
    row.map.with_index do |cell, col_index|
      case cell
      when 1 then new_cell = "/"
      when 2 then new_cell = "x"
      else new_cell = " "
      end
      opponent_board[row_index][col_index] = new_cell
    end
  end

  opponent_board
end

# Print GameBoard
# Input: A game board
def display_board(board)
  puts "    A   B   C   D   E   F   G   H   I   J  "
  puts "  " + "+---" * 10 + "+"

  board.each.with_index do |row, index|
    puts "#{index} | " + row.join(" | ") + " |" 
    puts "  " + "+---" * 10 + "+"
  end
end

# SHIP PLACEMENT

# Generate Ship Information for Each Player:
# Output: A hash containing remaining ships' information
def generate_ships
  { carrier:     5,
    battleship:  4,
    cruiser:     3,
    destroyer_1: 2,
    destroyer_2: 2,
    submarine_1: 1,
    submarine_2: 1 }
end

# Generate Ship Indexes
# Input: ship length, starting position, direction
# Output: An array of indexes where the ship is going to be placed
def generate_ship_indexes(ship_length, start_point, direction)
  row_index = start_point[0]
  col_index = start_point[1]
  result_indexes = [start_point]

  (ship_length - 1).times do |num|
    case direction
    when "UP"    then next_index = [row_index - 1, col_index]
    when "DOWN"  then next_index = [row_index + 1, col_index]
    when "LEFT"  then next_index = [row_index, col_index - 1]
    when "RIGHT" then next_index = [row_index, col_index + 1]
    end

    result_indexes << next_index
    row_index = next_index[0]
    col_index = next_index[1]
  end

  result_indexes
end

# Validate Ship Indexes
# Input: An array of indexes where a ship is going to be placed, a board
# Output: true | false
def indexes_valid?(indexes, board)
  invalid = indexes.find do |index|
    row_index = index[0]
    col_index = index[1]

    !(row_index >= 0 && row_index < 10 && col_index >= 0 && col_index < 10 && board[row_index][col_index] == 0)
  end

  !invalid
end

# Ship Key
def ship_key
  { carrier:     3,
    battleship:  4,
    cruiser:     5,
    destroyer_1: 6,
    destroyer_2: 7,
    submarine_1: 8,
    submarine_2: 9 }
end

# Get Ship Code
# Input: ship_type(symbol)
# Output: ship_code
def get_ship_code(ship_type)
  ship_key[ship_type]
end

# Get Ship Type
# Input: ship_code
# Output: ship_type
def get_ship_type(ship_code)
  ship_key.key(ship_code)
end

# Place Ship On Board
# Input: ship_type(symbol), indexes, board
def place_ship(ship_type, indexes, board)
  ship_code = get_ship_code(ship_type)

  indexes.each do |index|
    row_index = index[0]
    col_index = index[1]

    board[row_index][col_index] = ship_code
  end
end

# Check if Ship is Hit
# Input: an index, a board
# Output: ship if hit | false if missed | true if place shot before
def ship_hit?(index, board)
  row_index = index[0]
  col_index = index[1]
  cell = board[row_index][col_index]

  return false if cell == 0
  return true if (cell == 1) || (cell == 2)
  get_ship_type(cell)
end

# Record Shot
# Input: player_ship_info, index, board
def record_shot(ships, index, board)
  row_index = index[0]
  col_index = index[1]
  shot = ship_hit?(index, board)
  if shot == false
    board[row_index][col_index] = 1
  else
    board[row_index][col_index] = 2
    ships[shot] -= 1
  end
end

# Check if Ship is Sunk
# Input: player's ship information
# Output: true | false
def ship_sunk?(ships, ship)
  ships[ship] == 0
end













