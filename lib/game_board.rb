require './lib/board_positions.rb'
require './lib/first_ship_placement.rb'
require './lib/second_ship_placement.rb'
require 'pry'

class GameBoard
  include BoardPositions
  attr_reader :basic_spaces,
              :guessed_spaces,
              :empty_spaces,
              :small_ship,
              :large_ship

  def initialize
    @basic_spaces = []
    @empty_spaces = []
    @guessed_spaces = []
    @small_ship = []
    @large_ship = []
    make_spaces
  end

  def make_spaces
    spaces.each do |space|
      @basic_spaces << Space.new(space)
    end
    @empty_spaces = @basic_spaces
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
      @small_ship << @basic_spaces.find {|place| place.position == space}
    end
  end
end
