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
end
