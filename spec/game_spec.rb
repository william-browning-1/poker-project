require 'Game'

RSpec.describe Game do
  let(:game) { Game.new }

  describe '#initialize' do
    xit 'should initialize with the correct number of players' do
      allow(game).to receive(:gets).and_return("4\n") # Stubbing user input (4)
      expect(game.num_players).to eq(4)
      expect(game.players.length).to eq(4)
    end
  end

  describe '#start_round' do
    xit 'should shuffle the deck and deal cards to each player' do
      game.num_players = 4
      game.start_round
      expect(game.current_deck.deck.length).to eq(52 - (5 * game.num_players))
      game.players.each do |player|
        expect(player.hand.length).to eq(5)
      end
    end
  end

  describe '#find_last_instances' do
    before(:each) do
      @players = [
        Player.new(100, 1, nil),
        Player.new(200, 2, nil),
        Player.new(150, 1, nil),
        Player.new(300, 3, nil),
        Player.new(250, 2, nil)
      ]
    end

  xit 'returns the last instance of each player' do
    expected_result = [
      Player.new(150, 1, nil),
      Player.new(250, 2, nil),
      Player.new(300, 3, nil)
    ]

    expect(game.find_last_instance).to eq(expected_result)
  end
end
end
