class View

	attr_accessor :intro_screen_input

	def welcome_user
		system "clear"
		puts "\n\n\n"
		puts "WELCOME TO BATTLESHIP!"
		puts "_______________________________________"
		puts ''
		puts "ENTER '1' TO START A SINGLE PLAYER GAME"
		puts "ENTER '2' TO START A MULTIPLAYER GAME"
		puts "ENTER 'q' TO QUIT"
		puts "\n\n\n"
		@intro_screen_input = gets.chomp
		system "clear"
	end

	def quit_game
		if intro_screen_input == 'q'
			puts "\n\nSEE YOU NEXT TIME"
		elsif intro_screen_input == '2'
			puts "\n\n\n\n\n********************************************"
			puts "***** MULTIPLAYER IS NOT YET SUPPORTED *****"
			puts "********************************************"
		else
			puts "\n\n\n\n\n***************************************"
			puts "***** PLEASE ENTER A VALID OPTION *****"
			puts "***************************************"
		end
	end

	def give_user_instructions
		puts "\n\n\nPLEASE ENTER A COLUMN AND ROW IN THE FORM OF 'D7' \nIN ORDER TO SHOOT AT YOUR OPPONENT\n\n\n"
		puts "GAME STARTING IN 5 SECONDS"
		sleep(5)
	end

	def get_user_shot
		puts "\nYOUR TURN,"
		puts "ENTER A COORDINATE CAPTAIN:"
		user_shot = gets.chomp.downcase
	end

	def notify_computers_turn
		puts "\nCOMPUTER'S TURN:"
		sleep(1)
		puts "COMPUTER FIRING....."
		sleep(1.5)
	end

	def hit_ship
		system "clear"
		5.times {puts "\n"}
		puts "@@@ A SHIP WAS HIT @@@"
		sleep(2)
	end

	def missed_ship
		system "clear"
		5.times {puts "\n"}
		puts "--- NO SHIPS WERE HIT ---"
		sleep(2)
	end

	def show_boards(user_gameboard, computer_gameboard)
		system "clear"
		puts "YOUR BOARD:\n\n"
		user_gameboard.show_revealed_board
		puts "\nCOMPUTER'S BOARD:\n\n"
		computer_gameboard.show_hidden_board
	end

	def sink_message(ship)
		puts "\n***************************************"
		puts "#@@@@@@ YOU SUNK THE COMPUTER'S #{ship.name.upcase}!!! @@@@@@"
		puts "***************************************"
		sleep(3)
	end

	def computer_sink_message(ship)
		puts "\n***************************************"
		puts "#@@@@@@ THE COMPUTER SANK YOUR #{ship.name.upcase}!!! @@@@@@"
		puts "***************************************"
		sleep(3)
	end

	def user_wins
		10.times {puts "\n"}
		10.times {puts "***************************************"}
		2.times  {puts "*********                     *********"}
		puts           "*********       YOU WIN!      *********"
		2.times  {puts "*********                     *********"}
		10.times {puts "***************************************"}
	end

		def computer_wins
		10.times {puts "\n"}
		10.times {puts "***************************************"}
		2.times  {puts "*********                     *********"}
		puts           "*********    COMPUTER WINS!   *********"
		2.times  {puts "*********                     *********"}
		10.times {puts "***************************************"}
	end
end














