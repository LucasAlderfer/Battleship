require './lib/game_board.rb'
require './lib/board_positions.rb'
require './lib/text.rb'
require 'pry'

class GameLogic
include BasicGameFunctions
include Text

  def initialize
    @game = GameBoard.new
    @start_time = 0
    @computer = GameBoard.new
    @first_ship = nil
    @second_ship = nil
    @returns = []
    @computer_returns = []
  end

  def start
    puts start_game
  end

  def play_read_quit(choice)
    if choice == 'p' || choice == 'P' || choice == 'play' || choice == 'Play'
      return 1
    elsif choice == 'i' || choice == 'I' || choice == 'instrcutions'
      return 2
    elsif choice == 'q' || choice == 'Q' || choice == 'quit' || choice == 'Quit'
      return 3
    else
      return 4
    end
  end

  def operator(choice)
    if choice == 1
      true
    elsif choice == 2
      binding.pry
      puts instructions
    elsif choice == 3
      exit
    elsif choice == 4
      puts invalid_play_read_quit
    end
  end

  def player_setup_1
    @game.place_small_ship(@first_ship.first_ship)
    puts first_ship_placed
    @game.print_screen
  end

  def player_setup_2
    @game.place_large_ship(@second_ship.second_ship)
    puts both_ships_placed
    @game.print_screen
  end

  def computer_setup
    two_space = @computer.two_space_positions.shuffle.first.join(' ')
    first = FirstShipPlacement.new(two_space)
    @computer.place_small_ship(first.first_ship)
    three_space = @computer.valid_options.values.shuffle.first
    three_space = three_space.sort.join(' ')
    #maybe pass three_space to split this up
    second = SecondShipPlacement.new(three_space)
    @computer.place_large_ship(second.second_ship)
    puts enemy_ships_appear
    @computer.print_no_ship_screen
  end

  def valid_first_ship(input)
    @start_time = Time.now.to_i
    fsp = FirstShipPlacement.new(input)
    if fsp.valid?
      @first_ship = fsp
      true
    else
      puts invalid_first_ship
    end
  end


  def valid_second_ship(input)
    ssp = SecondShipPlacement.new(input)
    if ssp.valid(@game.valid_options)
      @second_ship = ssp
      true
    else
      puts invalid_second_ship
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
      if response == 3
        puts sunken_small_ship
      elsif response == 4
        puts sunken_large_ship
      end
      @returns << response
      @computer_returns << @game.computer_shoot
      puts linebreak
      puts shots_at_you
      @game.print_screen
      puts our_shots
      @computer.print_no_ship_screen
      check_for_win(@returns, @computer_returns)
    end
  end
end
