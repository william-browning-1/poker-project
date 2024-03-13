require 'Card'

RSpec.describe Card do
  let(:card) {Card.new}
  describe ".identity" do
    it "correctly identifies the rank and number of the card" do
      expect(card.identity(10,'hearts')).to eq("10 of hearts")
    end
  end
end
