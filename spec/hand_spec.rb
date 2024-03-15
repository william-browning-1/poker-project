require 'Hand'

RSpec.describe Hand do
  let(:hand) {Hand.new(Deck.new.random_cards)}
  '''
  describe \'.show_hand\' do
    it "Correctly names the card rank and suite" do
      expect(hand.show_hand).to eq(hand.cards.inspect)
    end
  end
  '''

  describe '.new' do
    it "Replaces face card ranks with corresponding integers" do
      expect(hand.rank_change).to noteq
    end
  end
end
