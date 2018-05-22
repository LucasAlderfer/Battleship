require './test/test_helper.rb'
require './lib/game_board.rb'

class GameBoardTest < Minitest::Test

  def test_it_exists
    gb = GameBoard.new
    assert_instance_of GameBoard, gb
  end

  def test_it_makes_its_basic_spaces
    gb = GameBoard.new
    assert_equal 16, gb.basic_spaces.length
  end

  def test_the_basic_spaces_have_values
    gb = GameBoard.new
    assert_equal 'A1', gb.basic_spaces[0].position
    assert_equal 'D2', gb.basic_spaces[13].position
  end

  def test_shots_can_be_taken
    gb = GameBoard.new
    gb.shoot('C3')
    assert_equal true, gb.basic_spaces[10].guessed
    gb.shoot('D4')
    assert_equal true, gb.basic_spaces[15].guessed
    assert_equal false, gb.basic_spaces[2].guessed
  end

  def test_it_can_assign_ship_spaces_for_first_ship
    gb = GameBoard.new
    ss = FirstShipPlacement.new('C1 B1').first_ship
    gb.place_small_ship(ss)
    assert_equal gb.small_ship, [gb.basic_spaces[4], gb.basic_spaces[8]]
  end

  def test_it_marks_spaces_of_small_ship_full
    gb = GameBoard.new
    ss = FirstShipPlacement.new('C1 B1').first_ship
    gb.place_small_ship(ss)
    assert_equal 2, gb.small_ship.length
    assert_equal true, gb.small_ship[0].fill
    assert_equal true, gb.small_ship[1].fill
  end

  def test_it_removes_correct_three_space_options
    gb = GameBoard.new
    ss = FirstShipPlacement.new('C1 B1').first_ship
    assert_equal 16, gb.valid_options.length
    gb.place_small_ship(ss)
    assert_equal 12, gb.valid_options.length
  end

  def test_it_occupies_big_ship_spaces
    gb = GameBoard.new
    fsp = FirstShipPlacement.new('A1 B1')
    ssp = SecondShipPlacement.new('B2 D2')
    assert_equal 0, gb.large_ship.length
    gb.place_small_ship(fsp.first_ship)
    gb.place_large_ship(ssp.second_ship)
    assert_equal 3, gb.large_ship.length
    assert_equal true, gb.large_ship[0].fill
    assert_equal true, gb.large_ship[1].fill
    assert_equal true, gb.large_ship[2].fill
  end

  def test_shots_can_hit_ships
    gb = GameBoard.new
    fsp = FirstShipPlacement.new('A1 B1')
    ssp = SecondShipPlacement.new('B2 D2')
    gb.place_small_ship(fsp.first_ship)
    gb.place_large_ship(ssp.second_ship)
    gb.shoot('C3')
    gb.shoot('C2')
    assert_equal false, gb.basic_spaces[15].fill
    assert_equal false, gb.basic_spaces[12].guessed
    assert_equal true, gb.basic_spaces[10].guessed
    assert_equal false, gb.basic_spaces[10].hit
    assert_equal true, gb.basic_spaces[0].fill
    assert_equal false, gb.basic_spaces[0].guessed
    assert_equal true, gb.basic_spaces[9].hit
  end

  def test_track_remaining_unguessed_spaces
    gb = GameBoard.new
    fsp = FirstShipPlacement.new('A1 B1')
    ssp = SecondShipPlacement.new('B2 D2')
    gb.place_small_ship(fsp.first_ship)
    gb.place_large_ship(ssp.second_ship)
    assert_equal 16, gb.remaining_unguessed_spaces.length
    gb.shoot('A2')
    gb.shoot('C2')
    gb.shoot('C1')
    gb.shoot('D4')
    assert_equal 12, gb.remaining_unguessed_spaces.length
  end

  def test_ships_can_sink
    gb = GameBoard.new
    fsp = FirstShipPlacement.new('A1 B1')
    ssp = SecondShipPlacement.new('B2 D2')
    gb.place_small_ship(fsp.first_ship)
    gb.place_large_ship(ssp.second_ship)
    assert_equal 2, gb.shoot('C2')
    assert_equal 2, gb.shoot('A1')
    assert_equal 1, gb.shoot('C2')
    assert_equal 3, gb.shoot('B1')
    assert_equal 5, gb.shoot('C1')
    assert_equal 2, gb.shoot('B2')
    assert_equal 4, gb.shoot('D2')
  end

end
