require_relative 'Player'

class Game < Player
  attr_accessor :num_players
  def initialize
    puts "Welcome to Poker! How many players are there?"
    $num_players = gets.chomp.to_i
    puts "\nInitializing Players...\n\n"

    puts "\n Each player starts with 100 chips"



    (0...$num_players).each do |player|
      $players << Player.new(100, player + 1)
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
    $pot = 30
    $current_bet = 20
    $players.each do |player|  #run each players turn.
      #while player.hand != nil #while they havent folded
          puts "\n #{player.id}"
          puts player.hand.show_hand
          puts "\n1)See, 2)Raise, or 3)Fold"
          choice = gets.chomp.to_i
        if choice == 1
          puts "\\n #{player.id}} Sees Bet..."
          sees_bet($current_bet)
          # $players << Player.new(player.chips, player.id).new_hand(player.hand)
        elsif choice == 2
          puts "How much would you like to raise?"
          curr_raise = gets.chomp.to_i
          raise_bet(curr_raise)
          # $players << Player.new(player.chips, player.id).new_hand(player.hand)
        elsif choice == 3
          puts "#{player.id} Folds...\n"
          player = Player.new(player.chips, player.id) #saves playerid and chips but removes hand
      #end
      end
    end
  end
end
