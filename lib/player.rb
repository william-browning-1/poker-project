require_relative 'Hand'

$players = []

class Player < Hand
  attr_accessor :chips, :hand
  def initialize(chips)
    @chips = chips
  end

  def new_hand(hand)
    @hand = Hand.new(hand)
  end



  def fold(player)
    player.hand = nil
  end

  def sees_bet

  end

end
