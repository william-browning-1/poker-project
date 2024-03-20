require_relative 'Hand'

$players = []

class Player < Hand
  attr_accessor :chips, :hand, :id
  def initialize(chips, id)
    @chips = chips
    @id = "Player #{id}"
  end

  def new_hand(hand)
    @hand = Hand.new(hand)
  end

  def fold(player)
    player.hand = nil
  end

  def sees_bet(bet)
    $pot += bet
    @chips -= bet
  end

  def raise_bet(bet)

    $current_bet += bet
    @chips -= $current_bet
    $current_bet
  end
end
