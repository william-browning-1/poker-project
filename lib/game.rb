require_relative 'Player'


class Game < Player
  attr_accessor :num_players
  def initialize
    puts "Welcome to Poker! How many players are there?"
    @num_players = gets.chomp.to_i
    if @num_players.is_a? Integer
      rounds
    end
  end

  def rounds
    puts "Dealing everyone their cards..."
    @round_deck = distribute_hands(@num_players)
    print @round_deck
  end

  def distribute_hands(num_players)
    (0...num_players).each do |card|
      Player.new(Deck.new.random_cards)
    end
  end
end

game_1 = Game.new
