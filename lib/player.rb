require_relative 'Hand'

$players = []

class Player < Hand
  attr_accessor :chips, :hand, :id
  def initialize(chips, id, hand)
    @chips = chips
    @id = id
    @hand = hand
  end

  def turn(player)
    if player.hand != nil
      puts "Player #{player.id}'s Turn\n\n"
      puts Hand.new(player.hand).show_hand

      puts "\n1)See, 2)Raise, or 3)Fold?"
      choice = gets.chomp.to_i
      if choice == 1
        @players << Player.new(player.chips, player.id, player.hand)
      elsif choice == 2
        loop do
          puts "\nHow much would you like to raise?"
          choice = gets.chomp.to_i
          begin
            choice = Integer(choice)
            if 0 < choice
              puts "Adding Raise to the Current Bet"
              break
            elsif choice < player.hand
              puts "You Don't have enough chips/n/nTry Again"
            else
              puts "Value is not an Integer\n\nTry Again"
            end
          end


        end
        @players << Player.new(player.chips, player.id, player.hand)
      elsif choice == 3
        @players << Player.new(player.chips, player.id, nil)
      end
    end

    #elminate

    #save_players
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
