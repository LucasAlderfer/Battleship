 require './test/test_helper.rb'
 require './lib/first_ship_placement.rb'

 class FirstShipPlacementTest < Minitest::Test

   def test_it_exists
     sp = FirstShipPlacement.new('A1 A2')
     assert_instance_of FirstShipPlacement, sp
   end

   def test_it_can_record_first_ship
     sp = FirstShipPlacement.new('B1 C1')
     assert_equal :B1C1, sp.first_ship
   end

   def test_placement_is_formatted
     sp = FirstShipPlacement.new('C1 B1')
     assert_equal :B1C1, sp.first_ship
   end

   def test_only_valid_positions_accepted
     sp_1 = FirstShipPlacement.new('A1 C1')
     sp_2 = FirstShipPlacement.new('F1 G1')
     sp_3 = FirstShipPlacement.new('A1 D1')
     sp_4 = FirstShipPlacement.new('A1 B1')
     assert_equal false, sp_1.valid?
     assert_equal false, sp_2.valid?
     assert_equal false, sp_3.valid?
     assert_equal true, sp_4.valid?
   end

 end
