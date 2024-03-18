require 'Game'

RSpec.describe Game do
  let(:game) {Game.new}
  describe 'rounds' do
    it 'Runs a single round of a Poker game' do
      expect(@players.length).to eq(15)
    end
  end
end
