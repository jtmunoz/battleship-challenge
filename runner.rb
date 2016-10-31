require_relative 'battleship'
  #name, size, quantity
computer_ship_hash ={
            "Carrier" => [5, 1],
            "Battleship" => [4, 1],
            "cruiser" => [3, 1],
            "Destroyer" => [2, 2],
            "Submarine" => [1, 2],
            }
user_ship_hash ={
            "Carrier" => [5, 1],
            "Battleship" => [4, 1],
            "cruiser" => [3, 1],
            "Destroyer" => [2, 2],
            "Submarine" => [1, 2],
            }
computer_board = []
computer_scoreboard = []
computer_tracker = []
user_board = []
user_scoreboard = []
user_tracker = []

#Set board-----------------------------------------------------------------------
#set up board for computer
computer_board = generate_board
# format_board(computer_board)
generate_random_board(computer_ship_hash,computer_board,"computer")
computer_tracker = beginning_tracker("computer")
puts "Computer board:"
format_board(computer_board)

#set up board for user
user_board = generate_board
#user input required
board_pref = ""
until board_pref == "Auto" || board_pref == "Manual"
  puts "Would you like to fill the board your self or auto generate it (Enter either Auto or Manual)?"
  board_pref = gets.chomp
end

if board_pref == "Auto"
  generate_random_board(user_ship_hash,user_board,"user")
  user_tracker = beginning_tracker("user")
  puts "Your board has been auto generated!"
  format_board(user_board)
else
  puts "Please place your ships according to the description below"
  spit_out_progress(user_ship_hash)
  format_board(user_board)
  until finished_manual_input?(user_ship_hash)
    puts "Which ship would you like to place? *cruiser is all lowercase"
    ship = ""
    until ship_valid?(user_ship_hash,ship)
      ship = gets.chomp
      puts "Wrong input (Remember it's case sensitive)" if !ship_valid?(user_ship_hash,ship)
    end
    if ship_avail?(ship,user_ship_hash)
      puts "What coordinate ranges would you like to put your ship (i.g. 'A1')"
      puts "Must be horizontally or vertically placed"
      # format_board(user_board)
      puts "First coordinate:"
      coord1 = coord_translater(gets.chomp)
      puts "Second coordinate:"
      coord2 = coord_translater(gets.chomp)
      place_ship(coord1,coord2,ship,user_board,user_ship_hash,"user")
      if !finished_manual_input?(user_ship_hash)
        puts "Here's your progress:"
        spit_out_progress(user_ship_hash)
        format_board(user_board)
      end#endif for finished manual input
    else
      puts "Ship unavailable"
      puts "Choose only available ships:"
      spit_out_progress(user_ship_hash)
    end#endif for ship available
  end#enduntil
puts "Your board is set!"
end#endif for board pref
#Set board-----------------------------------------------------------------------
