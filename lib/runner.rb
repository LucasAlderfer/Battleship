# require './lib/game_board.rb'
# require './lib/board_positions.rb'
# require 'pry'
# include BasicGameFunctions
# game = GameBoard.new
# #player_setup_1
# start_time = Time.now.to_i
# puts "Place first ship (formatted like 'A1 B1')"
# first_ship = nil
# loop do
#   fsp = FirstShipPlacement.new(gets.chomp)
#   if fsp.valid?
#     first_ship = fsp
#     break
#   else
#     puts "Please choose a valid position, the coordinates must be on the grid,"+
#       " and adjacent without wrapping the grid (how could a ship do that?)."
#   end
# end
# game.place_small_ship(first_ship.first_ship)
# puts "Your first ship has been placed!"
# game.print_screen
# #player_setup_2
# puts "Place second ship (formatted like 'A1 C1',"+
#      " must be exactly 2 spaces apart, no diagonals"+
#      " and cannot overlap your first ship!)"
# second_ship = nil
# loop do
#   ssp = SecondShipPlacement.new(gets.chomp)
#   if ssp.valid(game.valid_options)
#     second_ship = ssp
#     break
#   else
#     puts "Please choose a valid position, the coordinates must be on the grid,"+
#          " and in a horizontal or vertical line, without wrapping the board"+
#          " or overlapping your first ship.  Check the map!"
#          game.print_screen
#   end
# end
# game.place_large_ship(second_ship.second_ship)
# puts 'Both of your ships have been placed!'
# game.print_screen
# #computer_setup
# computer = GameBoard.new
# two_space = computer.two_space_positions.shuffle.first.join(' ')
# first = FirstShipPlacement.new(two_space)
# computer.place_small_ship(first.first_ship)
# three_space = computer.valid_options.values.shuffle.first
# three_space = three_space.sort.join(' ')
# second = SecondShipPlacement.new(three_space)
# computer.place_large_ship(second.second_ship)
# puts 'The enemy ships are somewhere on this grid!'
# computer.print_no_ship_screen
# #shooting_phase
# returns = []
# computer_returns = []
# loop do
#   puts 'Commander, what are the coordinates for your shot?'
#   response = computer.shoot(gets.chomp)
#   if response != 0 && response != 1
#     returns << response
#     computer_returns << game.computer_shoot
#     puts '=================================================='
#     puts 'Shots taken at your ships!'
#     game.print_screen
#     puts 'Shots you have taken at the enemy ships!'
#     computer.print_no_ship_screen
#     if returns.include?(3) && returns.include?(4)
#       end_time = Time.now.to_i
#       congratulations(returns, start_time, end_time)
#       break
#     elsif computer_returns.include?(3) && computer_returns.include?(4)
#       end_time = Time.now.to_i
#       sorry(computer_returns, start_time, end_time)
#       break
#     end
#   end
# end
require './lib/game_logic.rb'

battleship = GameLogic.new
battleship.start_game
loop do
  choice = battleship.play_read_quit(gets.chomp)
  play = battleship.operator(choice)
  break if play == true
end
puts "Place first ship (formatted like 'A1 B1')"
loop do
  valid = battleship.valid_first_ship(gets.chomp)
  break if valid == true
end
battleship.player_setup_1
puts "Place second ship (formatted like 'A1 C1',"+
     " must be exactly 2 spaces apart, no diagonals"+
     " and cannot overlap your first ship!)"
loop do
  valid = battleship.valid_second_ship(gets.chomp)
  break if valid == true
end
battleship.player_setup_2
battleship.computer_setup
puts 'Commander, what are the coordinates for your shot?'
loop do
  win = battleship.shots_fired(gets.chomp)
  break if win == true
  puts 'Commander, what are the coordinates for your shot?'
end
