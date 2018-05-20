require './lib/board_positions.rb'
require './lib/first_ship_placement.rb'
require './lib/game_board.rb'
require './lib/second_ship_placement.rb'
require './lib/space.rb'
require 'pry'

game = GameBoard.new
puts "Place first ship (2 entries, 1 coordinate each)"
fsp = FirstShipPlacement.new(gets.chomp, gets.chomp)
puts "Place second ship (2 entries, 1 coordinate each, must be exactly 2 spaces apart)"
ssp = SecondShipPlacement.new(gets.chomp, gets.chomp)
game.print_screen
