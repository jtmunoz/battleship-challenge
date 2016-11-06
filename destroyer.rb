class Destroyer < Ship

	attr_accessor :size

	def initialize
		super
		@size = 2
	end

end