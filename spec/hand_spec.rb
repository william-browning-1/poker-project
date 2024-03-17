require 'Hand'

RSpec.describe Hand do
  let(:hand) {Hand.new([Card.new(10, 'hearts'), Card.new(9, 'hearts'), Card.new(8, 'hearts'), Card.new(7, 'hearts'), Card.new(6, 'hearts')])}

  describe '.show_hand' do
    it "Correctly names the card rank and suite" do
      expect(hand.show_hand).to eq(hand.cards)
    end
  end


  describe '.is_a_flush' do
    it "Replaces face card ranks with corresponding integers" do
      expect(hand.is_a_flush).to eq(true)
    end
  end
end
