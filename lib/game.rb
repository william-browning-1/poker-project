require_relative 'Player'


class Game < Player
  attr_accessor :num_players
  def initialize
    puts "Welcome to Poker! How many players are there?"
    @num_players = gets.chomp.to_i

    @players = []

    (0...@num_players).each do |card|
      @players << Player.new(Deck.new.random_cards) #creates new players and gives them their first hand
    end
    @players.length
  end
end
