class Carrier < Ship

	attr_accessor :size, :name

	def initialize
		super
		@size = 5
		@name = "Carrier"
	end

end