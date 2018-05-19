require './lib/board_positions.rb'
require './lib/first_ship_placement.rb'
require './lib/second_ship_placement.rb'
require './lib/space.rb'
require 'pry'

class GameBoard
  include BoardPositions
  attr_reader :basic_spaces,
              :guessed_spaces,
              :empty_spaces,
              :small_ship,
              :large_ship,
              :valid_three_space_positions

  def initialize
    @basic_spaces = []
    @empty_spaces = []
    @guessed_spaces = []
    @small_ship = []
    @large_ship = []
    @valid_three_space_positions = three_space_positions.clone
    make_spaces
  end

  def make_spaces
    spaces.each do |space|
      @basic_spaces << Space.new(space)
    end
    @empty_spaces = @basic_spaces.clone
  end

  def shoot(space)
    target = @basic_spaces.find {|place| place.position == space}
    target.guess
    mark_guessed_space(target)
  end

  def mark_guessed_space(space)
    @guessed_spaces << space
    @empty_spaces.delete(space)
  end

  def place_small_ship(placement)
    occupied_spaces = symbols_for_two_space_positions[placement]
    occupied_spaces.each do |space|
      space_object = @basic_spaces.find {|place| place.position == space}
      @small_ship << space_object
      @empty_spaces.delete(space_object)
    end
    current_three_space_positions(placement)
  end

  def current_three_space_positions(placement)
    options_removed_by_first_unit_choice[placement].each do |option|
      @valid_three_space_positions.delete(option)
    end
    @valid_three_space_positions
  end

  def no_overlap?(placement)
    coordinates = symbols_for_three_space_positions[placement]
    @valid_three_space_positions.include?(coordinates)
  end
end
