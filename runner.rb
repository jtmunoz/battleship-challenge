require_relative 'battleship'

# Generate Game Board
computer_board = generate_board
player_board = generate_board

# Ship Placement for Player
player_ships = generate_ships
player_ships.each do | ship, length |
  system "clear" or system "cls"
  puts "Your Board:"
  display_board(convert_user_board(player_board))
  while true
    # Acquires information from player about ship placement:
    puts "Please Enter the Starting Coordinate You Would Like to Place Your #{ship.to_s}: (Ex: A4)"
    starting_point = gets.chomp
    if starting_point.empty? || !convert_coordinate(starting_point)
      puts "The Coordinate is Invalid. Please Try Again." # Check validity of user_coordinate
      next
    end
    starting_point = convert_coordinate(starting_point)

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
puts "Your Board:"
display_board(convert_user_board(player_board))

# Ship Placement for Computer
computer_ships = generate_ships
computer_ships.each do | ship, length |
  while true
    starting_point = [rand(0..9), rand(0..9)]
    indexes = generate_ship_indexes(length, starting_point, ["UP", "DOWN", "LEFT", "RIGHT"].sample)
    if indexes_valid?(indexes, computer_board)
      place_ship(ship, indexes, computer_board)
      break
    end
  end
end
puts "Computer's Board:"
display_board(convert_opponent_board(computer_board))

while true
  # Check if Game Ended
  if player_ships.select { |ship, value| !ship_sunk?(player_ships, ship) }.empty?
    winner = "Computer"
    break
  elsif computer_ships.select { |ship, value| !ship_sunk?(computer_ships, ship) }.empty?
    winner = "Player"
    break
  end

  # Player Turn:
  while true # Ask for a shot and test validity of coordinate
    puts "Please Enter the Coordinate You Would Like to Take a Shot:"
    target = gets.chomp
    if target.empty? || !convert_coordinate(target)
      puts "The Coordinate is Invalid. Please Try Again." # Check validity of user_coordinate
      next
    end
    target = convert_coordinate(target)
    ship = ship_hit?(target, computer_board)
    if ship == true
      puts "This Cell Has been Shot Before, Please Try a New Cell."
      next
    elsif ship == false
      puts "You Missed! Sorry! :("
      record_shot(computer_ships, target, computer_board)
      break
    else
      puts "You Hit a Ship!"
      record_shot(computer_ships, target, computer_board)
      if ship_sunk?(computer_ships, ship)
        puts "You Have Successfully Sunk an Enemy Ship! Congratulation!"
      end
      break
    end
  end
  sleep(1)
  system "clear" or system "cls"
  puts "Your Board:"
  display_board(convert_user_board(player_board))
  puts "Computer's Board:"
  display_board(convert_opponent_board(computer_board))

  # Computer Turn:
  while true
    target = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"].sample + rand(0..9).to_s
    index = convert_coordinate(target)
    ship = ship_hit?(index, player_board)
    if ship == true
      next
    end

    puts "The Computer Chose to Shot at #{target}."
    if ship == false
      puts "The Computer Missed!"
      record_shot(player_ships, index, player_board)
      break
    else
      puts "The Computer Hit Your Ship!"
      record_shot(player_ships, index, player_board)
      if ship_sunk?(player_ships, ship)
        puts "The Computer Have Sunk One of Your Ship!"
      end
      break
    end
  end
  sleep(1)
  system "clear" or system "cls"
  puts "Your Board:"
  display_board(convert_user_board(player_board))
  puts "Computer's Board:"
  display_board(convert_opponent_board(computer_board))
end

puts "The Game is Finished! Winner is #{winner}!"







