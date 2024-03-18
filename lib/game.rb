require_relative 'Player'


class Game < Player
  attr_accessor :num_players
  def initialize
    puts "Welcome to Poker! How many players are there?"
    @num_players = gets.chomp.to_i
    puts "What would you like each player's starting chips to be"
    @chip_count = gets.chomp.to_i

    puts "Initializing Players"
    @players = []
    (0...@num_players).each do |player|
      @players << Player.new(@chip_count)
    end
    single_round
  end

  def single_round
    @current_deck = Deck.new
    distribute_cards
  end

  def distribute_cards
    @players.each do |player|
      player.new_hand(@current_deck.random_cards)
    end
  end
end
