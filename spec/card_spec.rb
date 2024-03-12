require 'Card'

RSpec.describe Card do
  let(:card) {Card.new}
  describe ".rank" do
    it "correctly identifies the rank of the card" do
      expect(card.rank(:Q)).to eq(12)
    end
  end
end
