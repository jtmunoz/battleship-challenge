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
			puts "MULTIPLAYER IS NOT YET SUPPORTED"
		else
			puts "PLEASE ENTER A VALID OPTION"
		end
	end

	def give_user_instructions
		puts "\n\n\nPLEASE ENTER A COLUMN AND ROW IN THE FORM OF 'D7' \nIN ORDER TO SHOOT AT YOUR OPPONENT\n\n\n"
	end

	def get_user_shot
		puts "\nENTER A COORDINATE CAPTAIN:"
		user_shot = gets.chomp.downcase
	end

	def show_boards(user_gameboard, computer_gameboard)
		system "clear"
		puts "YOUR BOARD:\n\n"
		user_gameboard.show_revealed_board
		puts "\nCOMPUTER'S BOARD:\n\n"
		computer_gameboard.show_hidden_board
	end

end
