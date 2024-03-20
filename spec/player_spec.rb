require 'Player'

RSpec.describe Player do
  let(:player1) {Player.new(10000, 1)}

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

  describe '.raise_bet' do
    $current_bet = 20
    it 'Value must be greater than current bet when raising a bet' do
      expect(player1.raise_bet(25)).to eq(25) #function returns bet when it is greater than 20
    end

    it 'Returns message when the value isnt greater than current_bet' do
      expect(player1.raise_bet(20)).to match("A raised bet must be above the current bet")
    end
  end
end
