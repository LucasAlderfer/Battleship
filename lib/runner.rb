require './lib/game_logic.rb'

battleship = GameLogic.new
battleship.start
loop do
  choice = battleship.play_read_quit(gets.chomp)
  play = battleship.operator(choice)
  break if play == true
end
puts battleship.place_first_ship
loop do
  valid = battleship.valid_first_ship(gets.chomp)
  break if valid == true
end
battleship.player_setup_1
puts battleship.place_second_ship
loop do
  valid = battleship.valid_second_ship(gets.chomp)
  break if valid == true
end
battleship.player_setup_2
battleship.computer_setup
puts battleship.coordinates_needed
loop do
  win = battleship.shots_fired(gets.chomp)
  break if win == true
  puts battleship.coordinates_needed
end
