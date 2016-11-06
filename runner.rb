require_relative 'ship'
require_relative 'carrier'
require_relative 'battleship'
require_relative 'cruiser'
require_relative 'destroyer'
require_relative 'submarine'
require_relative 'fleet'
require_relative 'gameboard'


fleet = Fleet.new
gameboard = Gameboard.new(fleet)

p gameboard.hidden_board
p gameboard.taken_positions

gameboard.position_ships

gameboard.show_hidden_board

p gameboard.taken_positions

p fleet.fleet_ships[:submarine1].position
p fleet.fleet_ships[:submarine2].position
p fleet.fleet_ships[:destroyer1].position
p fleet.fleet_ships[:destroyer2].position
p fleet.fleet_ships[:cruiser].position
p fleet.fleet_ships[:battleship].position
p fleet.fleet_ships[:carrier].position

















