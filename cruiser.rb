class Cruiser < Ship

	attr_accessor :size, :name

	def initialize
		super
		@size = 3
		@name = "Cruiser"
	end

end