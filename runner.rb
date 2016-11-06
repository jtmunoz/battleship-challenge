require_relative 'ship'
require_relative 'carrier'
require_relative 'battleship'
require_relative 'cruiser'
require_relative 'destroyer'
require_relative 'submarine'
require_relative 'fleet'
require_relative 'gameboard'
require_relative 'view'
require_relative 'controller'


controller = Controller.new
controller.prompt_for_game
# user_fleet = Fleet.new
# computer_fleet = Fleet.new
# user_gameboard = Gameboard.new(user_fleet)
# computer_gameboard = Gameboard.new(computer_fleet)

# user_gameboard.show_hidden_board
# computer_gameboard.show_hidden_board


# view = View.new
# controller = Controller.new
# fleet = Fleet.new
# fleet2 = Fleet.new
# gameboard = Gameboard.new(fleet)
# gameboard2 = Gameboard.new(fleet2)

# # gameboard.position_ships

# gameboard.show_hidden_board
# gameboard2.show_hidden_board


# p gameboard.taken_positions
# p fleet.fleet_ships[:submarine1].position
# p fleet.fleet_ships[:submarine2].position
# p fleet.fleet_ships[:destroyer1].position
# p fleet.fleet_ships[:destroyer2].position
# p fleet.fleet_ships[:cruiser].position
# p fleet.fleet_ships[:battleship].position
# p fleet.fleet_ships[:carrier].position





