require 'Player'

RSpec.describe Player do
  let(:player1) {Player.new(10000)}

  describe '.new' do
    it 'initializes new players' do
      expect(player1.chips).to eq(10000)
    end
  end

  describe '.fold' do
    it 'deletes the hand from the current round, when selected' do
      player1.new_hand(Deck.new.random_cards)
      player1.fold(player1)
      expect(player1.hand).to eq(nil) #makes current hand nil but deletes saves chip count.
    end
  end
end
