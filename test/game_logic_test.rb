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

  def test_operator_directs_game
    logic = GameLogic.new
    assert_equal true, logic.operator(1)
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
    'Now, Commander, will you lead us? Or just walk away?...', logic.operator(2)
    assert_equal 'Please choose to (p)lay, read the (i)nstructions, or (q)uit!', logic.operator(4)
  end
end
