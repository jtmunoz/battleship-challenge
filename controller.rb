class Controller

	attr_accessor :controller, :user_fleet, :computer_fleet, :user_gameboard, 
		:computer_gameboard, :view, :number_shot

	def prompt_for_game
		@view = View.new
		view.welcome_user
		if view.intro_screen_input == '1'
			@user_fleet = Fleet.new
			@computer_fleet = Fleet.new
			@user_gameboard = Gameboard.new(user_fleet)
			@computer_gameboard = Gameboard.new(computer_fleet)
			start
		elsif view.intro_screen_input == 'q'
			view.quit_game
		else
			view.quit_game
			sleep(0.75)
			prompt_for_game
		end
	end

	def start
		user_gameboard.show_hidden_board
		view.give_user_instructions
		take_turns
	end

	def take_turns
		until computer_fleet.is_fleet_sunk? || user_fleet.is_fleet_sunk?
			view.show_boards(user_gameboard, computer_gameboard)
			shot = convert_user_shot(view.get_user_shot)
			if computer_gameboard.taken_positions.include?(shot)
				computer_gameboard.hit(shot)
				computer_fleet.fleet_ships.each_value do |ship|
					if ship.position.include?(shot)
						ship.hit
						if ship.is_sunk?
							view.show_boards(user_gameboard, computer_gameboard)
							view.sink_message(ship)
						end
					end
				end
				p computer_gameboard.taken_positions
			else
				computer_gameboard.miss(shot)
				p computer_gameboard.taken_positions
			end
			take_turns
		end
		if computer_fleet.is_fleet_sunk?
			view.user_wins
		elsif user_fleet.is_fleet_sunk?
			view.computer_wins
		end
	end

	def convert_user_shot(coord_shot)
		columns = 'abcdefghij'
		ones_place = columns.index(coord_shot[0]).to_s
		tens_place = coord_shot[1].to_s
		number_shot = (tens_place + ones_place).to_i
		p number_shot
		return number_shot
	end





end