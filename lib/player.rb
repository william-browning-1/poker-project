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

  def fold(player)
    player.hand = nil
  end

  def sees_bet(bet)
    $pot = $pot + bet
  end

  def raise_bet(bet, playerid)
    $current_bet = bet + $current_bet
    $pot = $current_bet + $pot
    puts "#{playerid} raises the bet to #{$current_bet}\n\n"
    $current_bet
  end

end
