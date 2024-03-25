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
    puts "Player #{player.id}'s Turn:\n\n"
    puts Hand.new(player.hand).show_hand
    if @player_turns < @num_players * 2
      draw_hand
    end

    puts "\n1)See, 2)Raise, or 3)Fold?"
    choice = gets.chomp.to_i
      if choice == 1
        @players << Player.new(player.chips, player.id, player.hand)
      elsif choice == 2 #if player raises raise the inputed value.
        loop do
          puts "\nHow much would you like to raise?"
          choice = gets.chomp.to_i
          begin
            choice = Integer(choice)
            if choice.between?(1, player.chips)
              puts "Adding Raise to the Current Bet"
              @current_bet += choice #updates current bet
              @pot += @current_bet #updates pot
              puts "Pot is #{@pot},
Current Bet is #{@current_bet}"
              break
            elsif choice > player.chips
              puts "You Don't have enough chips
Try Again"
              puts "Pot is #{@pot},
Current Bet is #{@current_bet}"
            else
              puts "Value is not a Positive Integer
Try Again"
            end
          end
        end
        @players << Player.new(player.chips, player.id, player.hand)
      elsif choice == 3 #if player folds give them a nil hand.
        @players << Player.new(player.chips, player.id, nil)
      end
  end

  def draw_hand
    puts Hand.new(player.hand).show_hand
  end
end
