require 'Hand'

RSpec.describe Hand do
  let(:hand) {Hand.new(Deck.new(random_cards))}
  describe '.show_hand' do
    it "Correctly names the card rank and suite" do
      expect(hand.show_hand).to eq(hand.cards)
    end
  end
  #(hand), true for flush and straight, false for pair and three of a kind
  let(:hand) {Hand.new([Card.new(10, 'hearts'), Card.new('king', 'hearts'), Card.new('queen', 'hearts'),
  Card.new('jack', 'hearts'), Card.new('ace', 'hearts')])}

  #(hand1), true for pair and three of a kind, false for flush and straight
  let(:hand1) {Hand.new([Card.new(10, 'hearts'), Card.new(10, 'hearts'), Card.new(10, 'hearts'),
  Card.new('jack', 'hearts'), Card.new('ace', 'hearts')])}

  #true case
  describe '.is_a_flush' do
    it "Responds with a boolean based on if the values are a flush" do
      expect(hand.is_a_flush?).to eq(true)
    end
  end
  #false case
  describe '.is_a_flush' do
    it "Responds with a boolean based on if the values are a flush" do
      expect(hand1.is_a_flush?).to eq(true)
    end
  end
  #true case
  describe '.is_a_straight' do
    it "Responds with a boolean based on if the values are a straight" do
      expect(hand.is_a_straight?).to eq(true)
    end
    #false case
    it "Responds with a boolean based on if the values are a straight" do
      expect(hand1.is_a_straight?).to eq(false)
    end
  end
  #true case
  describe '.is_a_pair?' do
    it "tells if their is a pair in the hand" do
      expect(hand1.is_a_pair?).to eq(true)
    end
  end
  #false case
  describe '.is_a_pair?' do
    it "tells if their is a pair in the hand" do
      expect(hand.is_a_pair?).to eq(false)
    end
  end
  #true case
  describe '.is_three_ofak?' do
    it "tells if their is three of a kind in the hand" do
      expect(hand1.is_three_ofak?).to eq(true)
    end
  end
  #false case
  describe '.is_three_ofak?' do
    it "tells if their is three of a kind in the hand" do
      expect(hand.is_three_ofak?).to eq(false)
    end
  end
end
