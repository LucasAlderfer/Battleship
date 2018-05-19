 require './test/test_helper.rb'
 require './lib/first_ship_placement.rb'

 class FirstShipPlacementTest < Minitest::Test

   def test_it_exists
     sp = FirstShipPlacement.new(['A1', 'A2'])
     assert_instance_of FirstShipPlacement, sp
   end

   def test_it_can_record_first_ship
     sp = FirstShipPlacement.new(['B1', 'C1'])
     assert_equal ['B1', 'C1'], sp.first_ship
   end

 end
