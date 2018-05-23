module BasicGameFunctions

  def object_at_coordinates(space)
    @basic_spaces.find {|place| place.position == space}
  end

  def print_screen
    # puts 'The Computers shots at your ships'
    puts '   1 2 3 4'
    puts '   = = = ='
    puts "A| #{@basic_spaces[0].display} #{@basic_spaces[1].display}"+
         " #{@basic_spaces[2].display} #{@basic_spaces[3].display}"
    puts "B| #{@basic_spaces[4].display} #{@basic_spaces[5].display}"+
         " #{@basic_spaces[6].display} #{@basic_spaces[7].display}"
    puts "C| #{@basic_spaces[8].display} #{@basic_spaces[9].display}"+
         " #{@basic_spaces[10].display} #{@basic_spaces[11].display}"
    puts "D| #{@basic_spaces[12].display} #{@basic_spaces[13].display}"+
         " #{@basic_spaces[14].display} #{@basic_spaces[15].display}"
  end

  def print_no_ship_screen
    @basic_spaces.map do |each|
      if each.display == '^'
        each.display = '~'
      end
    end
    # puts 'Your shots at the computer ships'
    puts '   1 2 3 4'
    puts '   = = = ='
    puts "A| #{@basic_spaces[0].display} #{@basic_spaces[1].display}"+
         " #{@basic_spaces[2].display} #{@basic_spaces[3].display}"
    puts "B| #{@basic_spaces[4].display} #{@basic_spaces[5].display}"+
         " #{@basic_spaces[6].display} #{@basic_spaces[7].display}"
    puts "C| #{@basic_spaces[8].display} #{@basic_spaces[9].display}"+
         " #{@basic_spaces[10].display} #{@basic_spaces[11].display}"
    puts "D| #{@basic_spaces[12].display} #{@basic_spaces[13].display}"+
         " #{@basic_spaces[14].display} #{@basic_spaces[15].display}"
  end

  def place_ship(occupied_spaces, ship)
    occupied_spaces.each do |space|
      space_object = object_at_coordinates(space)
      ship << space_object
    end
    fill_spaces(ship)
  end

  def fill_spaces(ship)
    ship.map do |space|
      space.fill_space
    end
  end

  def ship_sunk?(ship)
    if ship.none? { |space| space.hit == false }
      true
    else
      false
    end
  end

  def map_check
    puts "Commander, we have already taken that shot, check the map!"
  end

  def sunken_small_ship
    puts "You sunk the small ship!"
  end

  def sunken_large_ship
    puts "You sunk the large ship!"
  end

  def got_a_hit
    puts "You hit something!"
  end

  def miss
    puts "Your shot missed..."
  end

  def not_on_grid
    puts "Commander, that's not even on the grid! Try again!"
  end

  def hit_small_ship
    if ship_sunk?(@small_ship)
      return 3
    else
      return 2
    end
  end

  def hit_large_ship
    if ship_sunk?(@large_ship)
      return 4
    else
      return 2
    end
  end

  def remaining_unguessed_spaces
    @basic_spaces.find_all { |space| space.guessed == false }
  end

  def random_shot
    remaining_unguessed_spaces.shuffle.first
  end

  def congratulations(returns, start_time, end_time)
    time = game_time(start_time, end_time)
    puts "Congratulations! You sank all of your opponents ships in"+
         " #{returns.length} shots and that took #{time[0]} miuntes"+
         " and #{time[1]} seconds!"
  end

  def sorry(computer_returns, start_time, end_time)
    time = game_time(start_time, end_time)
    puts "Sorry! Your opponent sank all of your ships in"+
         " #{computer_returns.length} shots and that took #{time[0]}"+
         " minutes and #{time[1]} seconds!"
  end

  def game_time(start_time, end_time)
    total = end_time - start_time
    minutes = total / 60
    seconds = total % 60
    [minutes, seconds]
  end
end
