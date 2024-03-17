require 'Player'
'''
RSpec.describe Player do
  let(:player) {Player.new}

  describe \'.new\' do
    it \'initializes new players\' do
      expect(player).to eq(0)
    end
  end
end
'''
