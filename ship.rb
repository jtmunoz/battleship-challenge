class Ship

	attr_accessor :times_hit, :is_sunk, :position
	attr_reader :size

	def initialize
		@is_sunk = false
		@times_hit = 0
		@position
	end

	def hit
		self.times_hit += 1
		if times_hit >= size
			self.is_sunk = true
		end
	end

	def is_sunk?
		return self.is_sunk
	end

end