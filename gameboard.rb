require_relative 'fleet'

class Gameboard

	attr_accessor :board, :hidden_board, :fleet, :taken_positions

	def initialize(fleet)
		@fleet = fleet
		@board = Array.new
		@hidden_board = Array.new
		@taken_positions = Array.new
		self.create_board
		self.create_hidden_board
		self.position_ships
	end

	def create_board
		10.times do |row|
			board << Array.new(10, "-")
		end
	end

	def create_hidden_board
		10.times do |row|
			hidden_board << Array.new(10, "-")
		end
	end

	def show_hidden_spots
		@taken_positions.flatten!.each do |position|
			if position.to_s.length > 1
				self.hidden_board[position.to_s[0].to_i][position.to_s[1].to_i] = "X"
			else
				self.hidden_board[0][position] = "X"
			end
		end
	end

	def test_for_taken_spots(pos)
		until !@taken_positions.include?(pos)
			pos = rand(99)
		end
		return pos
	end

	def continue_placing_ship_horizontally(ship)
		initial_spot = test_for_taken_spots(rand(99))
		# p "IN CONTINUE HORIZONTALLY"
		spots_array = Array.new << initial_spot
		# p "spots_array before while statement: #{spots_array}"
		forwards_increment = 1
		backwards_increment = 1
		while spots_array.length < ship.size
			if ((initial_spot + forwards_increment) % 10) != 0
				next_spot = initial_spot + forwards_increment
				spots_array << next_spot
				forwards_increment += 1
			else 
				next_spot = initial_spot - backwards_increment
				spots_array << next_spot
				backwards_increment += 1
			end
		end
		# p "spots_array after while statement: #{spots_array}"
		@taken_positions.flatten! #flattening array so check can occur with numbers instead of other arrays
		@taken_positions << spots_array
		# p "taken_positions #{@taken_positions.flatten} after flattening and spots_array #{spots_array} before check loop"
		spots_array.each do |spot|
			if @taken_positions.include?(spot)
				# p true
				@taken_positions.pop
				continue_placing_ship_horizontally(ship)
				# p spots_array
			end
		end
		# p "spots array after do #{spots_array}"
		ship.position = spots_array
		# p @taken_positions
		return spots_array
	end

	def continue_placing_ship_vertically(ship)
		initial_spot = test_for_taken_spots(rand(99))
		# p "IN CONTINUE VERTICALLY"
		spots_array = Array.new << initial_spot
		# p "spots_array before while statement: #{spots_array}"
		forwards_increment = 10
		backwards_increment = 10
		while spots_array.length < ship.size
			if !((initial_spot + forwards_increment) > 99)
				next_spot = initial_spot + forwards_increment
				spots_array << next_spot
				forwards_increment += 10
			else 
				next_spot = initial_spot - backwards_increment
				spots_array << next_spot
				backwards_increment += 10
			end
		end
		# p "spots_array after while statement: #{spots_array}"
		@taken_positions.flatten! #flattening array so check can occur with numbers instead of other arrays
		@taken_positions << spots_array
		# p "taken_positions #{@taken_positions.flatten} after flattening and spots_array #{spots_array} before check loop"
		spots_array.each do |spot|
			if @taken_positions.include?(spot)
				# p true
				@taken_positions.pop
				continue_placing_ship_vertically(ship)
				# p spots_array
			end
		end
		# p "spots array after do #{spots_array}"
		ship.position = spots_array
		# @taken_positions << spots_array
		# p @taken_positions
		return spots_array
	end

	def position_ships
		continue_placing_ship_horizontally(fleet.fleet_ships[:submarine1])
		continue_placing_ship_horizontally(fleet.fleet_ships[:submarine2])
		rand(2) == 0 ? continue_placing_ship_horizontally(fleet.fleet_ships[:destroyer1]) : continue_placing_ship_vertically(fleet.fleet_ships[:destroyer1])
		rand(2) == 0 ? continue_placing_ship_horizontally(fleet.fleet_ships[:destroyer2]) : continue_placing_ship_vertically(fleet.fleet_ships[:destroyer2])
		rand(2) == 0 ? continue_placing_ship_horizontally(fleet.fleet_ships[:cruiser]) : continue_placing_ship_vertically(fleet.fleet_ships[:cruiser])
		rand(2) == 0 ? continue_placing_ship_horizontally(fleet.fleet_ships[:battleship]) : continue_placing_ship_vertically(fleet.fleet_ships[:battleship])
		rand(2) == 0 ? continue_placing_ship_horizontally(fleet.fleet_ships[:carrier]) : continue_placing_ship_vertically(fleet.fleet_ships[:carrier])
	end

	def show_hidden_board
		# show_hidden_spots #shows hidden spots on board - use for debugging
		puts "   A  B  C  D  E  F  G  H  I  J"
		@hidden_board.each_with_index do |row, index|
			puts "#{index}  #{row.join('  ')}"
		end
	end

	def show_revealed_board
		show_hidden_spots #shows hidden spots on board - use for debugging
		puts "   A  B  C  D  E  F  G  H  I  J"
		@hidden_board.each_with_index do |row, index|
			puts "#{index}  #{row.join('  ')}"
		end
	end

end



































