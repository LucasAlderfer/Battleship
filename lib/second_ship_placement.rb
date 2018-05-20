require './lib/board_positions.rb'
require './lib/first_ship_placement.rb'
require './lib/game_board.rb'

class SecondShipPlacement
  include BoardPositions
  attr_reader :second_ship

  def initialize(coordinates)
    @second_ship = coordinates
    format_placement
  end

  def format_placement
    @second_ship = @second_ship.split.sort.join.to_sym
  end

  def valid(valid_options)
    valid_options.keys.include?(@second_ship)
  end

end
