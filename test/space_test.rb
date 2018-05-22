require './test/test_helper.rb'
require './lib/space.rb'

class SpaceTest < Minitest::Test

  def test_it_exists
    s = Space.new('C3')
    assert_instance_of Space, s
  end

  def test_can_assigned_position
    s = Space.new('C3')
    assert_equal 'C3', s.position
  end

  def test_it_has_a_fill_status_that_can_change
    s = Space.new('C3')
    assert_equal false, s.fill
    s.fill_space
    assert_equal true, s.fill
  end

  def test_it_can_be_guessed
    s = Space.new('C3')
    assert_equal false, s.guessed
    s.guess
    assert_equal true, s.guessed
  end

  def test_it_can_be_hit
    s = Space.new('C3')
    assert_equal false, s.hit
    s.fill_space
    assert_equal false, s.hit
    s.guess
    assert_equal true, s.hit
  end

  def test_displays_change
    s = Space.new('C3')
    assert_equal '~', s.display
    s.guess
    assert_equal '?', s.display
    s.fill_space
    assert_equal '^', s.display
    s.guess
    assert_equal '*', s.display
  end

end
