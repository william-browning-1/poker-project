require 'Hand'

RSpec.describe Hand do
  let(:hand) {Hand.new(Deck.new(random_cards))}
  describe '.show_hand' do
    it "Correctly names the card rank and suite" do
      expect(hand.show_hand).to eq(hand.cards)
    end
  end

  let(:hand) {Hand.new([Card.new(10, 'hearts'), Card.new(9, 'hearts'), Card.new(8, 'hearts'),
              Card.new(7, 'hearts'), Card.new(6, 'hearts')])}
  describe '.is_a_flush' do
    it "Responds with a boolean based on if the values are a flush" do
      expect(hand.is_a_flush?).to eq(true)
    end
  end

  describe '.is_a_straight' do
    it "Responds with a boolean based on if the values are a straight" do
      expect(hand.is_a_straight?).to eq(true)
    end
  end
end
