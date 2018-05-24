module Text

  def start_game
    'Welcome to Battleship! Command your small fleet to victory!'
  end

  def p_i_q
    'Would you like to (p)lay, read the (i)nstrcutions, or (q)uit?'
  end

  def place_first_ship
    "Place first ship (formatted like 'A1 B1')"
  end

  def place_second_ship
    "Place second ship (formatted like 'A1 C1',"+
    ' must be exactly 2 spaces apart, no diagonals'+
    ' and cannot overlap your first ship!)'
  end

  def invalid_play_read_quit
    'Please choose to (p)lay, read the (i)nstructions, or (q)uit!'
  end

  def instructions
    "Commander, we have become embroiled in a small scale skirmish!\n\n"+
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
    'Now, Commander, will you lead us? Or just walk away?...'
  end

  def first_ship_placed
    'Your first ship has been placed!'
  end

  def both_ships_placed
    'Both of your ships have been placed!'
  end

  def enemy_ships_appear
    'The enemy ships are somewhere on this grid!'
  end

  def invalid_first_ship
    'Please choose a valid position, the coordinates must be on the grid,'+
    ' and adjacent without wrapping the grid (how could a ship do that?).'
  end

  def invalid_second_ship
    'Please choose a valid position, the coordinates must be on the grid,'+
    ' and in a horizontal or vertical line, without wrapping the board'+
    ' or overlapping your first ship.  Check the map!'
  end

  def coordinates_needed
    'Commander, what are the coordinates for your shot?'
  end


  def linebreak
    '=================================================='
  end

  def shots_at_you
    'Shots taken at your ships!'
  end

  def our_shots
    'Shots you have taken at the enemy ships!'
  end

  def map_check
    'Commander, we have already taken that shot, check the map!'
  end

  def sunken_small_ship
    'You sunk the small ship!'
  end

  def sunken_large_ship
    'You sunk the large ship!'
  end

  def got_a_hit
    'You hit something!'
  end

  def miss
    'Your shot missed...'
  end

  def not_on_grid
    'Commander, that is not even on the grid! Try again!'
  end

  def play_again
    'Commander, there are more zones of conflict, will you continue to fight?'\
      ' (play or quit)'
  end

  def end_turn
    'Commander, please confirm these are all your orders!'
  end

  def just_confirm
    'We really just need to move on, stop giving commands!'
  end
end
