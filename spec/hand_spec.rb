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

  describe ".strength_of_hand" do
    it 'compares to hands and determines strength of hand' do
      expect(hand.strength_of_hand).to eq(0)
    end
  end

end
