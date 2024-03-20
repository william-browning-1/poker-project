require 'Player'

RSpec.describe Player do
  let(:player1) {Player.new(10000, 1)}

  describe '.new' do
    it 'initializes new players' do
      expect(player1.chips).to eq(10000)
    end
  end
  describe '.fold' do
    xit 'deletes the hand from the current round, when selected' do
      player1.new_hand(Deck.new.random_cards)
      player1.fold(player1)
      expect(player1.hand).to eq(nil) #makes current hand nil but deletes saves chip count.
    end
  end

  #assumes 3 players.
  context '.raise_bet' do
    xit 'adds input into current bet, raising the current bet' do
      expect(player1.raise_bet(5,player1.id)).to eq(35) #returns current bet after the raise
    end
  end
end
