require './lib/board_positions.rb'

class FirstShipPlacement
  include BoardPositions
  attr_reader :first_ship

  def initialize(coordinate_1, coordinate_2)
    @first_ship = [coordinate_1, coordinate_2]
    format_placement
  end

  def format_placement
    @first_ship = @first_ship.sort.join.to_sym
  end

  def valid?
    symbols_for_two_space_positions.keys.include?(@first_ship)
  end

end
