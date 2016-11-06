class Battleship < Ship

	attr_accessor :size, :name

	def initialize
		super
		@size = 4
		@name = "Battleship"
	end

end