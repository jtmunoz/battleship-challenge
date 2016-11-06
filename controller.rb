class Controller

	attr_accessor :controller, :user_fleet, :computer_fleet, :user_gameboard, :computer_gameboard, :view

	def prompt_for_game
		@view = View.new
		view.welcome_user
		if view.intro_screen_input == '1'
			@user_fleet = Fleet.new
			@computer_fleet = Fleet.new
			@user_gameboard = Gameboard.new(user_fleet)
			@computer_gameboard = Gameboard.new(computer_fleet)
			start
		else
			view.quit_from_start
			sleep(0.5)
			prompt_for_game
		end
	end

	def start
		user_gameboard.show_hidden_board
	end





end