require_relative 'Hand'

$players = []

class Player < Hand
  attr_accessor :chips, :hand, :id
  def initialize(chips, id)
    @chips = chips
    @id = id
  end

  def new_hand(hand)
    @hand = Hand.new(hand)
  end


  def turns

    @current_bet = @pot
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
