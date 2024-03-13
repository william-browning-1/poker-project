require 'Deck'

RSpec.describe Deck do
  let(:deck) {Deck.new}
  describe ".shuffle_deck" do
    it "shuffles the cards in the deck" do
      expect(deck.compare(deck)).to be False
    end
  end
end
