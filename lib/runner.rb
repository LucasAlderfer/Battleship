require './lib/game_board.rb'
require './lib/board_positions.rb'
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
puts "Place second ship (formatted like 'A1 C1',"+
     " must be exactly 2 spaces apart, no diagonals"+
     " and cannot overlap your first ship!)"
second_ship = nil
loop do
  ssp = SecondShipPlacement.new(gets.chomp)
  if ssp.valid(game.valid_options)
    second_ship = ssp
    break
  else
    puts "Please choose a valid position, the coordinates must be on the grid,"+
         " and in a horizontal or vertical line, without wrapping the board"+
         " or overlapping your first ship.  Check the map!"
         game.print_screen
  end
end
game.place_large_ship(second_ship.second_ship)
game.print_screen
computer = GameBoard.new
two_space = computer.two_space_positions.shuffle.first.join(' ')
first = FirstShipPlacement.new(two_space)
computer.place_small_ship(first.first_ship)
three_space = computer.valid_options.values.shuffle.first
three_space = three_space.sort.join(' ')
second = SecondShipPlacement.new(three_space)
computer.place_large_ship(second.second_ship)
computer.print_no_ship_screen
returns = []
computer_returns = []
loop do
  puts 'Commander, what the coordinates for your shot?'
  returns << computer.shoot(gets.chomp)
  computer_returns << game.shoot(game.spaces.shuffle.first)
  game.print_screen
  computer.print_no_ship_screen
  if returns.include?(3) && returns.include?(4)
    break
  elsif computer_returns.include?(3) && computer_returns.include?(4)
    break
  end
end



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
