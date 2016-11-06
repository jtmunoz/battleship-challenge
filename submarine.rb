class Submarine < Ship

	attr_accessor :size, :name

	def initialize
		super
		@size = 1
		@name = "Submarine"
	end

end