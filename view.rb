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
	end

	def quit_from_start
		if intro_screen_input == 'q'
			puts "THANK YOU, COME AGAIN"
		elsif intro_screen_input == '2'
			puts "MULTIPLAYER IS NOT YET SUPPORTED"
		else
			puts "PLEASE ENTER A VALID OPTION"
		end

	end

end
