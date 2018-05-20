require './test/test_helper.rb'
require './lib/second_ship_placement.rb'

class SecondShipPlacementTest < Minitest::Test

  def test_it_exists
    sp = SecondShipPlacement.new('A1 A2')
    assert_instance_of SecondShipPlacement, sp
  end

  def test_it_can_record_second_ship
    sp = SecondShipPlacement.new('A1 C1')
    assert_equal :A1C1, sp.second_ship
  end

  def test_placement_is_formatted
    sp = SecondShipPlacement.new('C1 B1')
    assert_equal :B1C1, sp.second_ship
  end

  def test_only_valid_positions_accepted
    sp_1 = SecondShipPlacement.new('A1 C1')
    sp_2 = SecondShipPlacement.new('F1 G1')
    sp_3 = SecondShipPlacement.new('A1 D1')
    sp_4 = SecondShipPlacement.new('A1 B1')
    assert_equal true, sp_1.valid?
    assert_equal false, sp_2.valid?
    assert_equal false, sp_3.valid?
    assert_equal false, sp_4.valid?
  end

end
