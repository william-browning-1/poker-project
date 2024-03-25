require 'Player'

RSpec.describe Player do
  let(:player1) {Player.new(Deck.new.random_cards(5))}

  describe '.new' do
    xit 'initializes new players' do
      expect(player1.chips).to eq(10000)
    end
  end
end
