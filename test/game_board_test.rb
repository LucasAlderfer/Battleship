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
    assert_equal 16, gb.empty_spaces.length
  end

  def test_shots_can_be_taken
    gb = GameBoard.new
    gb.shoot('C3')
    assert_equal 'C3', gb.guessed_spaces.last.position
    gb.shoot('D4')
    assert_equal 'D4', gb.guessed_spaces.last.position
  end


  def test_it_can_remember_guessed_spaces
    gb = GameBoard.new
    shot_1 = gb.basic_spaces[10]
    shot_2 = gb.basic_spaces[15]
    gb.shoot('C3')
    gb.shoot('D4')
    assert_equal 2, gb.guessed_spaces.length
    assert_equal 14, gb.empty_spaces.length
    assert_equal [shot_1, shot_2], gb.guessed_spaces
  end

  def test_it_can_assign_ship_spaces_for_first_ship
    gb = GameBoard.new
    ss = FirstShipPlacement.new('C1', 'B1').first_ship
    gb.place_small_ship(ss)
    assert_equal gb.small_ship, [gb.basic_spaces[4], gb.basic_spaces[8]]
  end

  def test_it_removes_ship_spaces_from_empty
    gb = GameBoard.new
    ss = FirstShipPlacement.new('C1', 'B1').first_ship
    gb.place_small_ship(ss)
    assert_equal 14, gb.empty_spaces.length
    assert_equal 2, gb.small_ship.length
  end

  def test_it_removes_correct_three_space_options
    gb = GameBoard.new
    ss = FirstShipPlacement.new('C1', 'B1').first_ship
    gb.place_small_ship(ss)
    assert_equal 12, gb.valid_three_space_positions.length
  end

  def test_no_overlapping_ships
    gb = GameBoard.new
    fsp = FirstShipPlacement.new('A1', 'B1')
    ssp_1 = SecondShipPlacement.new('A1', 'C1')
    ssp_2 = SecondShipPlacement.new('B2', 'D2')
    gb.place_small_ship(fsp.first_ship)
    assert_equal false, gb.no_overlap?(ssp_1.second_ship)
    assert_equal true, gb.no_overlap?(ssp_2.second_ship)
  end
end
