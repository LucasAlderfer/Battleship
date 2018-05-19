require './lib/board_positions.rb'

class GameBoard
  include BoardPositions
  attr_reader :basic_spaces, :guessed_spaces

  def initialize
    @basic_spaces = []
    @guessed_spaces = []
    make_spaces
  end

  def make_spaces
    spaces.each do |space|
      @basic_spaces << Space.new(space)
    end
  end

  def mark_guessed_space
    @basic_spaces.any? {|space| }
end
