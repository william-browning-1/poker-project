require 'Card'

RSpec.describe Card do
  let(:card) {Card.new(10, "hearts")}
  describe ".new" do
    it "correctly identifies the rank and number of the card" do
      expect(card.rank).to eq(10)
      expect(card.suit).to eq('hearts')
    end
  end
end
