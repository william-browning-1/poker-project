require_relative 'Hand'

class Player < Hand
  attr_accessor :chips, :hand
  def initialize(chips)
    @chips = chips
  end

  def new_hand(hand)
    @hand = Hand.new(hand)
  end

  def fold
    puts "Folds"
    # $players.delete(@hand)
  end

  def sees_bet
    puts "Calls"
  end


end
