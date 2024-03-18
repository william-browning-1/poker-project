require 'Player'

RSpec.describe Player do
  let(:player) {Player.new(10000)}

  describe '.new' do
    it 'initializes new players' do
      expect(player.chips).to eq(10000)
    end
  end
end
