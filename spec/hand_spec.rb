require 'Hand'

RSpec.describe Hand do
  let(:hand) {Hand.new(Deck.new(random_cards))}
  describe '.show_hand' do
    it "Correctly names the card rank and suite" do
      expect(hand.show_hand).to eq(hand.cards)
    end
  end

  let(:hand) {Hand.new([Card.new(10, 'hearts'), Card.new(9, 'hearts'), Card.new(8, 'hearts'),
              Card.new(7, 'spades'), Card.new(6, 'hearts')])}
  #problem with this test and function
  describe '.is_a_flush' do
    it "Responds with a boolean based on if the values are a flush" do
      expect(hand.is_a_flush?).to eq(true)
    end
  end
  #problem with this test and function
  describe '.is_a_straight' do
    it "Responds with a boolean based on if the values are a straight" do
      expect(hand.is_a_straight?).to eq(true)
    end
  end

  let(:hand) {Hand.new([Card.new(10, 'hearts'), Card.new('king', 'hearts'), Card.new('queen', 'hearts'),
  Card.new('queen', 'hearts'), Card.new('queen', 'hearts')])}

  describe '.is_a_pair?' do
    it "tells if their is a pair in the hand" do
      expect(hand.is_a_pair?).to eq(true)
    end
  end

  describe '.is_three_ofak?' do
    it "tells if their is three of a kind in the hand" do
      expect(hand.is_three_ofak?).to eq(true)
    end
  end
end
