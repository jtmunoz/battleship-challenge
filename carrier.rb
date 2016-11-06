class Carrier < Ship

	attr_accessor :size

	def initialize
		super
		@size = 5
	end

end