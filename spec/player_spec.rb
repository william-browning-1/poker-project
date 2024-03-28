require 'Player'

RSpec.describe Player do
  let(:player1) {Player.new(100, 1, nil)}

  describe '.new' do
    it 'initializes new players' do
      expect(player1.chips).to eq(100)
    end
  end

  describe '.new' do
    it 'starts with a nil hand' do
      expect(player1.hand).to eq(nil)
    end
  end

  describe 'eliminate' do
    it 'eliminates a player when they have 0 chips' do
      expect(@players.include(Player.new(0, 1, nil))).to eql?(false)
    end
  end
end
