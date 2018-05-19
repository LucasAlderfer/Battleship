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

  def test_it_can_mark_guessed_spaces
    gb = GameBoard.new
    s = Space.new('C3')
    s.guess
    assert_equal ['C3'], gb.guessed_spaces
  end 
end
