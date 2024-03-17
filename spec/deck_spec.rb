require 'Deck'

RSpec.describe Deck do
  let(:deck1) {Deck.new}
  describe ".shuffle_deck" do
    it "has the correct number of cards in the deck" do
      #expect(deck1.deck.length).to eq(52)  #took out .shuffle_deck
    end
  end

  describe ".random_cards" do
    it "Takes cards in a players hand out of the deck" do

      expect(deck1.random_cards.length).to eq(5)
    end
  end
'''
  describe ".deal_cards" do
    it "deals the correct amount of cards based on the number of players" do
      deck1.deal_cards(6)
      expect(deck1.deck.length).to eq(52-30)
    end

    it "has correct number of hands corresponding to players" do
      expect(deck1.deal_cards(6).length).to eq(6)
    end
  end
end
'''
end
