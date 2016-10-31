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
user_shot_hist = []
computer_shot_hist = []

puts "Would you like to see the computer's screen? y or n"
pref = ''
until pref == 'y' || pref == 'n'
  pref = gets.chomp.downcase
end
if pref == 'y'
  display = true
else
  display = false
end

#Set board-----------------------------------------------------------------------
#set up board for computer
computer_board = generate_board
# format_board(computer_board)
generate_random_board(computer_ship_hash,computer_board,"computer")
computer_tracker = beginning_tracker("computer")
puts "Computer board:" if display
format_board(computer_board) if display

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

puts "Awesome, let's play!"
puts "Flip coin to see who starts. Heads or Tails?"
user_choice = ''
until user_choice == "heads" || user_choice == "tails"
  user_choice = gets.chomp.downcase
end
result = heads_or_tails
if result == user_choice
  puts "You're right, go first"
else
  puts "Wrong, computer goes first"
end

# if result == user_choice

  beat_user = false
  beat_computer = false

  # p @g_array
  # p @g_array_user

  #user first
  until beat_user || beat_computer
    #user turn
    puts "Computer board:" if display
    format_board(computer_board) if display
    puts "Where do you want to fire?"
    valid_counter = 0
    until valid_counter > 0
      user_valid = 0
      until user_valid > 0
        user_call = gets.chomp
        user_valid += 1 if valid_call?(user_call)
      end
      user_shot = coord_translater(user_call)
      valid_counter += 1 if valid_shot?(user_shot,computer_board)
      shoot(user_shot,computer_board,computer_tracker,"user")
      # if valid_shot?(user_shot,computer_board)
      puts "You already shot that!" if valid_counter == 0
      # puts "Computer board:" if display
      # format_board(computer_board) if display
    end#enduntil
    user_shot_hist << user_call
    ship_sunk(computer_tracker,"user")
    if finished?(computer_tracker)
      beat_computer = true
      puts "Congratulations!! You Won!!!"
      break
    end
    # spit_out_progress(computer_ship_hash) if !finished?(computer_tracker)
    sleep(2.0)
    #computer turn
    puts "Computer move --------------------------------------------"
    valid_counter_comp = 0
    until valid_counter_comp > 0
      computer_call = coord_generation_randomly
      computer_shot = coord_translater(computer_call)
      valid_counter_comp += 1 if valid_shot?(computer_shot,user_board) && !computer_shot_hist.include?(computer_call)
      shoot(computer_shot,user_board,user_tracker,"computer")
    end#enduntil
    computer_shot_hist << computer_call
    ship_sunk(user_tracker,"computer")
    if finished?(user_tracker)
      beat_user = true
      puts "Boo.... You Lost..."
      break
    end
    puts "Your board:"
    format_board(user_board) if !finished?(user_tracker)
    puts "Computer move --------------------------------------------"
  end#end generall loop

# else
#
#   beat_user = false
#   beat_computer = false
#
#   until beat_user || beat_computer
#     #computer turn
#     valid_counter_comp = 0
#     until valid_counter > 0
#       computer_shot = coord_translater(coord_generation_randomly)
#       shoot(computer_shot,user_board,user_tracker,"computer")
#       valid_counter_comp += 1 if valid_shot?(computer_shot,user_board)
#     end#enduntil
#     ship_sunk(user_tracker,"computer")
#     beat_user = true if finished?(user_tracker)
#     puts "Your current position"
#     spit_out_progress if !finished?(user_tracker)
#
#       #user turn
#     puts "Computer board:" if display
#     format_board(computer_board) if display
#     puts "Where do you want to fire?"
#     valid_counter = 0
#     until valid_counter > 0
#       user_call = gets.chomp
#       user_shot = coord_translater(user_call)
#       shoot(user_shot,computer_board,computer_tracker,"user")
#       valid_counter += 1 if valid_shot?(user_shot,computer_board)
#       puts "You already shot that!" if valid_counter == 0
#     end#enduntil
#     user_shot_hist << user_call
#     ship_sunk(computer_tracker,"user")
#     beat_computer = true if finished?(computer_tracker)
#     spit_out_progress if !finished?(computer_tracker)
#   end#end generall loop
#
# end#endif who goes first
