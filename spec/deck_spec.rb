require 'Deck'

RSpec.describe Deck do
  let(:deck1) {Deck.new}
  describe ".shuffle_deck" do
    it "has the correct number of cards in the deck" do
      deck1.shuffle_deck
      expect(deck1.deck.length).to eq(52)
    end
  end

  describe ".random_card" do
    it "correct number of cards are dealt" do
      deck1.random_card
      expect(deck1.hand.length).to eq(5)
    end
    it "Takes cards in hand out of the deck" do
      expect(deck1.random_card).to eq(47)
    end
  end
end
