require './lib/game_board.rb'
require './lib/board_positions.rb'
require 'pry'

class GameLogic
include BasicGameFunctions

  def initialize
    @game = GameBoard.new
    @start_time = 0
    @computer = GameBoard.new
    @first_ship = nil
    @second_ship = nil
    @returns = []
    @computer_returns = []
  end

  def start_game
    puts 'Welcome to Battleship! Command your small fleet to victory!'
    puts 'Would you like to (p)lay, read the (i)nstrcutions, or (q)uit?'
  end

  def play_read_quit(choice)
    if choice == 'p' || choice == 'P' || choice == 'play' || choice == 'Play'
      return 1
      # player_setup
    elsif choice == 'i' || choice == 'I' || choice == 'instrcutions'
      return 2
      # instrcutions
    elsif choice == 'q' || choice == 'Q' || choice == 'quit' || choice == 'Quit'
      return 3
      exit
    else
      puts "Please choose to (p)lay, read the (i)nstructions, or (q)uit!"
      return 4
    end
  end

  def operator(choice)
    if choice == 1
      true
    elsif choice == 2
      instrcutions
    elsif choice == 3
      exit
    elsif choice == 4
      puts "Please choose to (p)lay, read the (i)nstructions, or (q)uit!"
    end
  end



  def instrcutions
    puts 'Commander, we have become embroiled in a small scale skirmish!'
    puts ' '
    puts 'You must direct the two ships we have here into strategic positions!'
    puts 'As you can see, one of our ships will take up two of the coordinates'+
         ' on the grid, and the other will take up three coordinates.'
    puts ' '
    puts 'We rely on you to give us the adjacent coordinates for the small'+
         ' ship and the first and last coordinates for the large ship.'
    puts ' '
    puts 'Remember, for maximum accuracy, our ships must be vertical'+
         ' or horizontal on the grid!'
    puts ' '
    puts 'Our enemy will be following the same logic when positioning their'+
         ' ships, which are the same sizes as ours.'
    puts ' '
    puts 'Commander, we need you to direct our fire at the grid to sink the'+
         ' enemy ships before we are sunk ourselves!'
    puts 'Choose one coordinate on the grid at a time to fire at and we will'+
         ' notify you of the results immediately!'
    puts 'Our enemy will most likely fire back while we reload, we will'+
         ' keep you notified of the coordinates they have fired on!'
    puts ' '
    puts 'Now, Commander, will you lead us? Or just walk away?...'
  end

  # def player_setup_1
  #   @start_time = Time.now.to_i
  #   puts "Place first ship (formatted like 'A1 B1')"
    # valid_first_ship
  def player_setup_1
    @game.place_small_ship(@first_ship.first_ship)
    puts 'Your first ship has been placed!'
    @game.print_screen
  end

  def player_setup_2
    # valid_second_ship
    @game.place_large_ship(@second_ship.second_ship)
    puts 'Both of your ships have been placed!'
    @game.print_screen
  end

  def computer_setup
    two_space = @computer.two_space_positions.shuffle.first.join(' ')
    first = FirstShipPlacement.new(two_space)
    @computer.place_small_ship(first.first_ship)
    three_space = @computer.valid_options.values.shuffle.first
    three_space = three_space.sort.join(' ')
    second = SecondShipPlacement.new(three_space)
    @computer.place_large_ship(second.second_ship)
    puts 'The enemy ships are somewhere on this grid!'
    @computer.print_no_ship_screen
  end

  def valid_first_ship(input)
    @start_time = Time.now.to_i
    fsp = FirstShipPlacement.new(input)
    if fsp.valid?
      @first_ship = fsp
      true
    else
      puts "Please choose a valid position, the coordinates must be on the grid,"+
           " and adjacent without wrapping the grid (how could a ship do that?)."
    end
  end


  def valid_second_ship(input)
    ssp = SecondShipPlacement.new(input)
    if ssp.valid(@game.valid_options)
      @second_ship = ssp
      true
    else
      puts "Please choose a valid position, the coordinates must be on the grid,"+
           " and in a horizontal or vertical line, without wrapping the board"+
           " or overlapping your first ship.  Check the map!"
      @game.print_screen
    end
  end

  def check_for_win(returns, computer_returns)
    if returns.include?(3) && returns.include?(4)
      end_time = Time.now.to_i
      congratulations(returns, @start_time, end_time)
      true
    elsif computer_returns.include?(3) && computer_returns.include?(4)
      end_time = Time.now.to_i
      sorry(computer_returns, @start_time, end_time)
      true
    end
  end

  def shots_fired(input)
    response = @computer.shoot(input)
    if response != 0 && response != 1
      @returns << response
      @computer_returns << @game.computer_shoot
      puts '=================================================='
      puts 'Shots taken at your ships!'
      @game.print_screen
      puts 'Shots you have taken at the enemy ships!'
      @computer.print_no_ship_screen
      check_for_win(@returns, @computer_returns)
    end
  end
end
