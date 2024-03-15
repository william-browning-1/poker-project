require_relative 'Deck'

class Hand < Deck
  attr_accessor :cards
  def initialize(cards)
    @cards = cards
    @rank_change = []
    face_cards = ['ace', 'king', 'queen', 'jack']

    @cards.each do |card|
      @rank_change << card.rank
    end

    @rank_change.each do |card|
      if face_cards.include?(card)
        0...3.each do |fc_index|
          face_cards[face_cards.index(card)] = Card.new(14 - fc_index, card.suite)
        end
      end
    end

  end

  def show_hand
    @cards.each do |card|
      "#{card.rank} of #{card.suite}"
    end
  end
end
