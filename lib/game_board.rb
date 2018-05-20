require './lib/board_positions.rb'
require './lib/first_ship_placement.rb'
require './lib/second_ship_placement.rb'
require './lib/space.rb'
require './lib/basic_game_functions.rb'
require 'pry'

class GameBoard
  include BoardPositions
  include BasicGameFunctions
  attr_reader :basic_spaces,
              :small_ship,
              :large_ship,
              :valid_options

  def initialize
    @basic_spaces = []
    @small_ship = []
    @large_ship = []
    @valid_options = symbols_for_three_space_positions.clone
    make_spaces
  end

  def make_spaces
    spaces.each do |space|
      @basic_spaces << Space.new(space)
    end
  end

  def shoot(space)
    target = object_at_coordinates(space)
    if target.guessed
      map_check
      return 1
    else
      target.guess
      check_shot(target)
    end
  end

  def check_shot(target)
    if target.fill
      got_a_hit
      if @small_ship.include?(target)
        hit_small_ship
      elsif @large_ship.include?(target)
        hit_large_ship
      end
    else
      miss
      return 5
    end
  end

  def place_small_ship(placement)
    occupied_spaces = symbols_for_two_space_positions[placement]
    place_ship(occupied_spaces, @small_ship)
    current_three_space_positions(placement)
  end

  def place_large_ship(placement)
    occupied_spaces = spaces_occupied[placement]
    place_ship(occupied_spaces, @large_ship)
  end

  def current_three_space_positions(placement)
    options_removed_by_first_unit_choice[placement].each do |option|
      symbol = option.sort.join.to_sym
      @valid_options.delete(symbol)
    end
  end
end
