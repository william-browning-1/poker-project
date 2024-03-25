require 'Game'

RSpec.describe Game do
 let(:game) {Game.new}

 let(:player) {Player.new(100, 1, nil)}
  describe '.start_round' do
    it 'sets the initial bet to be the same as the pot' do
     expect(@pot).to eq(@current_bet)
   end

   describe '.turn(player)' do
    it 'changes the chips of the player when starting the initial bets' do
      expect{game.start_round}.to change {player.chips}
    end
   end
end
end
