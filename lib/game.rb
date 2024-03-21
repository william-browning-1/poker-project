require_relative 'Player'

class Game < Player
  attr_accessor :num_players
  def initialize
    puts "Welcome to Poker! How many players are there?"
    $num_players = gets.chomp.to_i
    puts "\nInitializing Players...\n\n"

    puts "Each player starts with 100 chips\n\n"


    @players = []
    (0...$num_players).each do |player|
      @players << Player.new(100, player + 1)
    end

    @player_save = []
    start_round
  end

  def start_round
    puts "\nShuffling..."
    @current_deck = Deck.new #new deck for every round
    puts "\nDealing...\n\n"

    @players.each do |player|  #distributes hands
      player.new_hand(@current_deck.random_cards)
    end

    $pot = 0

    puts "Initial Bets are 10 chips each:\n"
    @players.each do |player| #create ante game based on number of players
      $pot += 10
      player.chips = player.chips - 10
    end
  end
end

game_1 = Game.new
