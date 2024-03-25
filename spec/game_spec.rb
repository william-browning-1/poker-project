require 'Game'

RSpec.describe Game do
 let(:game) {Game.new}

 let(:player) {Player.new(100, 1, nil)}
  describe '.start_round' do
    it 'sets the initial bet to be the same as the pot' do
     expect(@pot).to eq(@current_bet)
   end
end
end
