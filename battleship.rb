class Battleship < Ship

	attr_accessor :size

	def initialize
		super
		@size = 4
	end

end