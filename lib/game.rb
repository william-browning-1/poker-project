require_relative 'Player'

class Game < Player
  attr_accessor :num_players
  def initialize
    puts "Welcome to Poker! How many players are there?"
    $num_players = gets.chomp.to_i
    puts "What would you like each player's starting chips to be?"
    @chip_count = gets.chomp.to_i
    puts "Initializing Players"

    (0...$num_players).each do |player|
      $players << Player.new(@chip_count)
    end
    single_round
  end

  def single_round
    puts "\nShuffling...
    "
    @current_deck = Deck.new
    puts "\nDealing...\n"
    distribute_cards
  end

  def distribute_cards
    $players.each do |player|
      player.new_hand(@current_deck.random_cards)
    end
    player_turns
  end

  def player_turns
    i = 0
    $players.each do |player|  #run each players turn.
      i += 1
      puts "\nPlayer \##{i}"
      puts player.hand.show_hand
      puts "\n1)See, 2)Raise, or 3)Fold"
      choice = gets.chomp.to_i
      if choice == 1
        sees_bet
      elsif choice == 2
        puts "How much would you like to raise?"
        curr_raise = gets.chomp.to_i
        raise_bet(curr_raise)
      elsif choice == 3
        puts "\nPlayer \##{i} Folds..."
        fold(player)
        if player.hand.eql?(nil)
          player = Player.new(player.chips)
        end
      end
    end
  end
end
