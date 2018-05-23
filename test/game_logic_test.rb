require './test/test_helper.rb'
require './lib/game_logic.rb'

class GameLogicTest < Minitest::Test

  def test_it_exists
    logic = GameLogic.new
    assert_instance_of GameLogic, logic
  end

  def test_it_starts
    logic = GameLogic.new
    assert_equal 'Welcome to Battleship! Command your small fleet to victory!'+
    "\nWould you like to (p)lay, read the (i)nstrcutions, or (q)uit?", logic.start_game
  end

  def test_play_read_quit
    logic = GameLogic.new
    assert_equal 1, logic.play_read_quit('p')
    assert_equal 2, logic.play_read_quit('i')
    assert_equal 3, logic.play_read_quit('q')
    assert_equal 4, logic.play_read_quit('gfcvghf')
  end

  def test_display_instructions
    logic = GameLogic.new
    assert_equal "Commander, we have become embroiled in a small scale skirmish!\n\n"+
    "You must direct the two ships we have here into strategic positions!\n\n"+
    'As you can see, one of our ships will take up two of the coordinates'+
    " on the grid, and the other will take up three coordinates.\n\n"+
    'We rely on you to give us the adjacent coordinates for the small'+
    " ship and the first and last coordinates for the large ship.\n\n"+
    'Remember, for maximum accuracy, our ships must be vertical'+
    " or horizontal on the grid!\n\n"+
    'Our enemy will be following the same logic when positioning their'+
    " ships, which are the same sizes as ours.\n\n"+
    'Commander, we need you to direct our fire at the grid to sink the'+
    " enemy ships before we are sunk ourselves!\n\n"+
    'Choose one coordinate on the grid at a time to fire at and we will'+
    " notify you of the results immediately!\n\n"+
    'Our enemy will most likely fire back while we reload, we will'+
    " keep you notified of the coordinates they have fired on!\n\n"+
    'Now, Commander, will you lead us? Or just walk away?...', logic.instructions
  end

  def test_first_ship_placed
    logic = GameLogic.new
    assert_equal 'Your first ship has been placed!', logic.first_ship_placed
  end

  def test_both_ships_placed
    logic = GameLogic.new
    assert_equal 'Both of your ships have been placed!', logic.both_ships_placed
  end

  def test_enemy_ships_appear
    logic = GameLogic.new
    assert_equal 'The enemy ships are somewhere on this grid!', logic.enemy_ships_appear
  end

  def test_invalid_first_ship
    logic = GameLogic.new
    assert_equal 'Please choose a valid position, the coordinates must be on the grid,'+
    ' and adjacent without wrapping the grid (how could a ship do that?).', logic.invalid_first_ship
  end

  def test_invalid_second_ship
    logic = GameLogic.new
    assert_equal 'Please choose a valid position, the coordinates must be on the grid,'+
    ' and in a horizontal or vertical line, without wrapping the board'+
    ' or overlapping your first ship.  Check the map!', logic.invalid_second_ship
  end

  def test_linebreak
    logic = GameLogic.new
    assert_equal '==================================================', logic.linebreak
  end

  def test_coordinates_needed
    logic = GameLogic.new
    assert_equal 'Commander, what are the coordinates for your shot?', logic.coordinates_needed
  end

  def test_shots_at_you
    logic = GameLogic.new
    assert_equal 'Shots taken at your ships!', logic.shots_at_you
  end

  def test_our_shots
    logic = GameLogic.new
    assert_equal 'Shots you have taken at the enemy ships!', logic.our_shots
  end
end
