require './lib/game_board.rb'
require 'pry'

game = GameBoard.new
puts "Place first ship (formatted like 'A1 B1')"
first_ship = nil
loop do
  fsp = FirstShipPlacement.new(gets.chomp)
  if fsp.valid?
    first_ship = fsp
    break
  else
    puts "Please choose a valid position, the coordinates must be on the grid,"+
      " and adjacent without wrapping the board."
  end
end
game.place_small_ship(first_ship.first_ship)
game.print_screen
# puts "Place second ship (formatted like 'A1 C1', must be exactly 2 spaces apart, no diagonals)"
# ssp = SecondShipPlacement.new(gets.chomp)


# def place_second_ship
#   second_ship_position(gets.chomp)
# end


# def second_ship_position(input)
#   puts "Place second ship (formatted like 'A1 C1',"+
#        " must be exactly 2 spaces apart, no diagonals"+
#        " and cannot overlap your first ship!)"
#   ssp = SecondShipPlacement.new(input)
#   unless ssp.valid(game.valid_options)
#     puts "Please choose a valid position, the coordinates must be on the grid,"+
#          " and in a horizontal or vertical line, without wrapping the board"+
#          " or overlapping your first ship.  Check the map!"
#     game.print_screen
#     place_second_ship
#   end
#   ssp
# end
