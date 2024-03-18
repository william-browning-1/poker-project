require 'Game'

RSpec.describe Game do
  let(:game) {Game.new}
  describe 'rounds' do
    xit 'Runs a single round of a Poker game' do
      expect(game).to eq()
    end
  end

  describe 'deal the correct number of cards' do
    it 'deals cards based on number of players' do
      expect(game.distribute_cards.length).to eq(3) #when user input for number of players is 3
    end
  end
end
