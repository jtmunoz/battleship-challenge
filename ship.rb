
class Ship
  attr_reader :size
  attr_accessor :health
  def initialize
    @size = []
    @health = 0
  end

  def health
    @health = self.size.length
  end

  def health=(health)
    @health = health
  end
end
