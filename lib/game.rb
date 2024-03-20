require_relative 'Player'

class Game < Player
  attr_accessor :num_players
  def initialize
    puts "Welcome to Poker! How many players are there?"
    $num_players = gets.chomp.to_i
    puts "\nInitializing Players...\n\n"

    puts "Each player starts with 100 chips\n\n"



    (0...$num_players).each do |player|
      $players << Player.new(100, player + 1)
    end

    @player_save = []
    single_round
  end

  def single_round
    puts "\nShuffling...
    "
    @current_deck = Deck.new #new deck for every round
    puts "\nDealing...\n\n"

    $players.each do |player|  #distributes hands
      player.new_hand(@current_deck.random_cards)
    end

    $pot = 0

    $players.each do |player| #create ante game based on number of players
      $pot += 10
      player.chips = player.chips - 10
    end

    $current_bet = $pot
    puts "Starting bet is #{$current_bet}\n"

    @player_hands = $players.map{|player| player.hand}

    while @player_hands.length != 1
      $players.each do |player|  #run each players turn.
            puts "#{player.id}\n\n"
            puts player.hand.show_hand

            puts "\n1)See, 2)Raise, or 3)Fold"
            choice = gets.chomp.to_i
            if choice == 1
            puts "#{player.id} Sees Bet..."
            sees_bet($current_bet)

            player.chips = player.chips - $current_bet
            puts "#{player.id}'s Remaining Chips: #{player.chips}\n"

          elsif choice == 2
            puts "How much would you like to raise?"
            curr_raise = gets.chomp.to_i

            raise_bet(curr_raise, player.id)
            player.chips = player.chips - $current_bet
            puts "#{player.id}'s Remaining Chips: #{player.chips}\n"
          elsif choice == 3
            puts "#{player.id} Folds...\n\n"
            @player_save << Player.new(player.chips, player.id) #saves playerid and chips but removes hand
            @player_hands.delete(player.hand)
          end
        end
          puts @player_save
      end
  end
end

game_1 = Game.new
