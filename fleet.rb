class Fleet 

	attr_reader :fleet_ships

	def initialize
		carrier = Carrier.new
		battleship = Battleship.new
		cruiser = Cruiser.new
		destroyer1 = Destroyer.new
		destroyer2 = Destroyer.new
		submarine1 = Submarine.new
		submarine2 = Submarine.new
		@fleet_ships = {carrier: carrier, battleship: battleship, cruiser: cruiser, 
			destroyer1: destroyer1, destroyer2: destroyer2, submarine1: submarine1, 
			submarine2: submarine2}
	end

	def is_fleet_sunk?
		sunk_ships = 0
		self.fleet_ships.each do |shipkey, shipvalue|
			if shipvalue.is_sunk?
				sunk_ships += 1
			end
		end
		sunk_ships >= fleet_ships.length ? true : false
	end

end