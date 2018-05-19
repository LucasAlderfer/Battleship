require './lib/board_positions.rb'
require './lib/first_ship_placement.rb'
require './lib/game_board.rb'

class SecondShipPlacement
  include BoardPositions
  attr_reader :second_ship

  def initialize(coordinate_1, coordinate_2)
    @second_ship = [coordinate_1, coordinate_2]
    format_placement
  end

  def format_placement
    @second_ship = @second_ship.sort.join.to_sym
  end

  def valid?
    symbols_for_three_space_positions.keys.include?(@second_ship)
  end

end
