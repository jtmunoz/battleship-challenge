require_relative 'ship'
class Battleship < Ship
  def initialize
    super
    @size = Array.new(5, "C")
  end

end
