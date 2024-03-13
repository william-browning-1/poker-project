require 'Deck'

RSpec.describe Deck do
  let(:deck) {Deck.new}
  describe ".num" do
    it "has a correct number of cards in the deck" do
      expect(deck.create_deck).to eq(52)
    end
  end
end
