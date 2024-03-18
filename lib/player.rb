require_relative 'Hand'

class Player < Hand
  attr_accessor :chips
  def initialize(chips)
    @chips = chips

  end

  def new_hand(hand)
    @hand = Hand.new(hand)
  end
end
