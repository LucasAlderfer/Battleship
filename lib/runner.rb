require './lib/game_logic.rb'

battleship = GameLogic.new
puts battleship.start_game
puts battleship.p_i_q
loop do
  choice = battleship.play_read_quit(gets.chomp)
  play = battleship.operator(choice)
  break if play == true
end
loop do
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
  puts `clear`
  battleship.player_setup_2
  battleship.computer_setup
  loop do
    puts battleship.coordinates_needed
    win = battleship.shots_fired(gets.chomp)
    break if win == true
    if win != 0
      puts battleship.end_turn
      battleship.confirm_turn(gets.chomp)
    end
  end
  puts battleship.play_again
  loop do
    choice = battleship.play_read_quit(gets.chomp)
    play = battleship.operator(choice)
    if play == true
      puts battleship.start_game
      break
    end
  end
end
