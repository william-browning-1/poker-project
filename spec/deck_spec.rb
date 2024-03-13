require 'Deck'

RSpec.describe Deck do
  let(:deck) {Deck.new}
  describe ".shuffle_deck" do
    it "has the correct number of cards in the deck" do
      expect(deck.shuffle_deck).to eq(52)
    end
  end


end
