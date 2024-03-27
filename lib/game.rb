require_relative 'Player'

class Game < Player
  attr_accessor :num_players, :current_deck, :players
  def initialize
    puts "Welcome to Poker! How many players are there?"
    @num_players = gets.chomp.to_i

    while !@num_players.between?(2,6)
      puts "Value Error: must be 2-6 players,
Try Again:"
      @num_players = gets.chomp.to_i
    end

    puts "\nInitializing Players...\n\n"

    puts "Each player starts with 200 chips\n\n"


    @players = []
    (0...@num_players).each do |player|
      @players.push(Player.new(200, player + 1, nil)) #hand starts as a nil value.
    end

    length = @players.length
    puts length

    start_round
  end

  def start_round
    puts "\nShuffling..."
    @current_deck = Deck.new #new deck for every round
    puts "\nDealing...\n\n"

    @players.each do |player|  #distributes hands
      puts player.hand
      player.hand = @current_deck.random_cards(5)
    end

    @pot = 0

    puts "Initial Bets are 10 chips each:\n"
    @players.each do |player| #create ante game based on number of players
      @pot += 10
      player.chips = player.chips - 10
    end
    @current_bet = @pot
    puts "\nStarting bet is #{@current_bet}\n"

    @player_turns = 0
    @players.each do |player|
      if player.hand != nil
        if @player_turns < @num_players
          puts "(First Round)"
          turn(player)
          @player_turns += 1
        elsif @player_turns >= @num_players
          puts "(Draw Round)"
          turn(player)
          @player_turns += 1
        else
          @player_turns += 1
        end
      end
    end
  end
end

game_1 = Game.new
