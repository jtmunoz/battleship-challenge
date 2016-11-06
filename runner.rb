require_relative 'ship'
require_relative 'carrier'
require_relative 'battleship'
require_relative 'cruiser'
require_relative 'destroyer'
require_relative 'submarine'
require_relative 'fleet'
require_relative 'gameboard'


# carrier = Carrier.new


# p carrier.class
# p carrier.size

# p carrier.is_sunk?
# p carrier.times_hit
# carrier.hit 
# 4.times {carrier.hit}
# p carrier.times_hit
# p carrier.is_sunk?

# p fleet
# p fleet.is_fleet_sunk?
# p fleet.fleet_hash[:carrier].is_sunk?
# 5.times {fleet.fleet_hash[:carrier].hit}
# p fleet.fleet_hash[:carrier].is_sunk?
# 4.times {fleet.fleet_hash[:battleship].hit}
# p fleet.fleet_hash[:battleship].is_sunk?
# p fleet.is_fleet_sunk?
# 3.times {fleet.fleet_hash[:cruiser].hit}
# p fleet.fleet_hash[:cruiser].is_sunk?
# 2.times {fleet.fleet_hash[:destroyer1].hit}
# 2.times {fleet.fleet_hash[:destroyer2].hit}
# 1.times {fleet.fleet_hash[:submarine1].hit}
# p fleet.is_fleet_sunk?
# 1.times {fleet.fleet_hash[:submarine2].hit}
# p fleet.is_fleet_sunk?
fleet = Fleet.new
gameboard = Gameboard.new(fleet)

p gameboard.hidden_board
p gameboard.taken_positions

gameboard.position_ships

gameboard.show_hidden_board

p gameboard.taken_positions



















