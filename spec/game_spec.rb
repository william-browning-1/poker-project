require 'Game'

RSpec.describe Game do
 let(:game) {Game.new}
  describe '.distribute_cards' do
    xit 'Runs a single round of a Poker game' do
     expect(game.distribute_cards.length).to eq(3)
   end
  end
end
