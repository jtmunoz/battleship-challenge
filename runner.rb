require_relative 'battleship'

# Generate Game Board
computer_board = generate_board
player_board = generate_board

# Ship Placement for Player
player_ships = generate_ships
player_ships.each do | ship, length |
  while true
    system "clear" or system "cls"
    display_board(convert_user_board(player_board))
    # Acquires information from player about ship placement:
    puts "Please Enter the Starting Coordinate You Would Like to Place Your #{ship.to_s}: (Ex: A4)"
    starting_point = convert_coordinate(gets.chomp)
    if !starting_point
      puts "The Coordinate is Invalid. Please Try Again." # Check validity of user_coordinate
      next
    end

    if (ship != :submarine_1) && (ship != :submarine_2)
      puts "Please Enter the Direction You Would Like Your Ship to Lay Out: (UP/DOWN/LEFT/RIGHT)"
      direction = gets.chomp
    end

    indexes = generate_ship_indexes(length, starting_point, direction) # Check if placement is valid
    if indexes_valid?(indexes, player_board)
      place_ship(ship, indexes, player_board)
      break
    else
      puts "The Placement is Invalid. Please Try Again."
    end
  end
end

system "clear" or system "cls"
display_board(convert_user_board(player_board))