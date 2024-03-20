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

    player_turns
  end

    def player_turns

      $current_bet = $pot
      puts "Starting bet is #{$current_bet}\n"

      @players.each do |player|  #run each players turn.
        puts "Player #{player.id}'s Turn\n\n"
        puts player.hand.show_hand

        puts "\n1)See, 2)Raise, or 3)Fold?"
        choice = gets.chomp.to_i
        choices = [1,2,3]
        while (choices.include?(choice)).eql?(false)
            puts "Invalid Input\n1)See, 2)Raise, or 3)Fold?"
            choice = gets.chomp.to_i
        end
        if choice == 1
          sees_bet($current_bet)
          if player.chips > $current_bet
            puts "Player #{player.id} Sees Bet..."
            player.chips = player.chips - $current_bet
            puts "Player #{player.id}'s Remaining Chips: #{player.chips}\n"
          else
            puts "Player #{player.id} is All In!"
          end
        elsif choice == 2
          puts "How much would you like to raise?"
          curr_raise = gets.chomp.to_i
          raise_bet(curr_raise, player.id)
          if player.chips > $current_bet
              player.chips = player.chips - $current_bet
          else
              puts "Player #{player.id} is All In!"
          end
              puts "Player #{player.id}'s Remaining Chips: #{player.chips}\n"
        elsif choice == 3
          puts "Player #{player.id} Folds...\n\n"
          @player_save << Player.new(player.chips, player.id) #saves playerid and chips but removes hand
          @players.delete(player)
            end
      end

      elminate

      save_players

    end

    def save_player                   #saves players whos still are in the game,
      @player_save.each do |player|   #but lost or folded on the previous hand.
        @players << player
      end
    end

    def elminate #used to eliminate players if they ended which 0 chips after the round ends
      @players.reject! { |player| player.chips <= 0}
    end
end

game_1 = Game.new
