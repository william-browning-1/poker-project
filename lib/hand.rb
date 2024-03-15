require_relative 'Deck'

class Hand < Deck
  attr_accessor :cards
  def initialize(cards)
    @cards = cards
    face_cards = ['ace', 'king', 'queen', 'jack']

    @cards.each do |card|
      if (card.rank).is_a?(String)
        while face_cards.include?(card.rank)
          if card.rank.eql?('jack')
            @card << Card.new(11, card.suite)
            break
          elsif card.rank.eql?('queen')
            @card << Card.new(12, card.suite)
            break
          elsif card.rank.eql?('king')
            @card << Card.new(13, card.suite)
            break
          elsif card.rank.eql?('ace')
            fc_rank << Card.new(14, card.suite)
            break
          end
        end
      end
    end

  def show_hand
    @cards.each do |card|
      "#{card.rank} of #{card.suite}"
    end
  end

  def strength_of_hand

  end
end

hand_1 = Hand.new(Deck.new.random_cards)
hand_1.strength_of_hand
