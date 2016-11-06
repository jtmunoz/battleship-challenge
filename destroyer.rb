class Destroyer < Ship

	attr_accessor :size, :name

	def initialize
		super
		@size = 2
		@name = "Destroyer"
	end

end