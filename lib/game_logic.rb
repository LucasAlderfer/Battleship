require './lib/game_board.rb'
require './lib/board_positions.rb'
require 'pry'

class GameLogic
include BasicGameFunctions

  def initialize
    @game = GameBoard.new
    @start_time = 0
    @computer = GameBoard.new
  end

  def start_game
    puts 'Welcome to Battleship! Command your small fleet to victory!'
    puts 'Would you like to (p)lay, read the (i)nstrcutions, or (q)uit?'
  end

  def play_read_quit(choice)
    if choice == 'p' || choice == 'P' || choice == 'play' || choice == 'Play'
      player_setup
    elsif choice == 'i' || choice == 'I' || choice == 'instrcutions'
      instrcutions
    elsif choice == 'q' || choice == 'Q' || choice == 'quit' || choice == 'Quit'
      exit
    else
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

  def player_setup_1
    @start_time = Time.now.to_i
    puts "Place first ship (formatted like 'A1 B1')"
    valid_first_ship
    @game.place_small_ship(valid_first_ship.first_ship)
    puts 'Your first ship has been placed!'
    @game.print_screen
  end

  def valid_first_ship
    first_ship = nil
    loop do
      fsp = FirstShipPlacement.new(gets.chomp)
      if fsp.valid?
        first_ship = fsp
        break
      else
        puts "Please choose a valid position, the coordinates must be on the grid,"+
          " and adjacent without wrapping the grid (how could a ship do that?)."
      end
    end
  end
