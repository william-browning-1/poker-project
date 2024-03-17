require_relative 'Deck'

class Hand < Deck
  attr_accessor :cards, :rank_change
  def initialize(cards)
    @cards = cards
    @rank_change = []
    @suites = []
    # face_cards = ['ace', 'king', 'queen', 'jack'] (saving all commented things for later and instead, hardcoding)
    '''
    @cards.each do |card|
      @rank_change << card
    end

    @rank_change.each do |card|
      if face_cards.include?(card)
        [0,1,2,3].each do |fc_index|
          face_cards[face_cards.index(card)] = Card.new(14 - fc_index, card.suite)
        end
        end
      end
    end
    '''
  end

  def to_s
    @cards.each do |card|
      "#{card.rank} of #{card.suite}"
    end
  end
  def show_hand
    @cards.each do |card|
      "#{card.rank} of #{card.suite}"
    end
  end

  def is_a_flush
    suits = @cards.select{|card| card.suit}
    return False if suits.uniq.lenght > 1
    True
  end
end
