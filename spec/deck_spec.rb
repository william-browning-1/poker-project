require 'Deck'

RSpec.describe Deck do
  let(:deck1) {Deck.new}
  describe '.random_cards' do
    it 'takes out the correct number of cards' do
      expect(deck1.random_cards.length).to eq(5)
    end

    it 'takes the cards out of the deck that have been dealt' do
      deck1.random_cards
      deck1.random_cards
      expect(deck1.deck.length).to eq(52-10)  # 5 cards * 2 random_cards calls
    end
  end
end
