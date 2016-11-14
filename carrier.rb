require_relative 'ship'
class Carrier < Ship

  def initialize
    super
    @size = Array.new(5, "C")
  end
end

#boat = Carrier.new
#pu =  boat.health
#p pu - 1
#p pu
#boat.health = pu
#p boat.health
