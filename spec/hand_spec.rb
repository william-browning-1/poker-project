require 'Hand'
RSpec.describe Hand do
  #(hand), true for flush and straight, false for pair and three of a kind
  let(:hand) {Hand.new([Card.new(10, 'hearts'), Card.new('king', 'hearts'), Card.new('queen', 'hearts'),
  Card.new('jack', 'hearts'), Card.new('ace', 'hearts')])}

  #(hand1), true for pair and three of a kind, false for flush and straight
  let(:hand1) {Hand.new([Card.new(10, 'hearts'), Card.new(10, 'spades'), Card.new(10, 'clubs'),
  Card.new('jack', 'hearts'), Card.new('ace', 'hearts')])}

  #(hand2), used for four of a kind true case
  let(:hand2) {Hand.new([Card.new(10, 'hearts'), Card.new(10, 'spades'), Card.new(10, 'clubs'),
  Card.new(10, 'diamonds'), Card.new('ace', 'hearts')])}

  #(hand3), used for full house true case
  let(:hand3) {Hand.new([Card.new(10, 'hearts'), Card.new(10, 'spades'), Card.new(10, 'clubs'),
  Card.new('queen', 'hearts'), Card.new('queen', 'spades')])}

  #(hand4), used for two pair true case
  let(:hand4) {Hand.new([Card.new(10, 'hearts'), Card.new(10, 'spades'), Card.new(9, 'clubs'),
  Card.new(9, 'hearts'), Card.new('queen', 'spades')])}

  #(hand5), used for two pair true case
  let(:hand5) {Hand.new([Card.new('ace', 'hearts'), Card.new(6, 'spades'), Card.new(2, 'clubs'),
  Card.new(5, 'hearts'), Card.new('queen', 'spades')])}

''' commenting this out because of formatting issues
  describe \'.show_hand\' do
    it "Correctly names the card rank and suite" do
      expect(hand.show_hand).to eq(\'10 of hearts
      king of hearts
      queen of hearts
      jack of hearts
      ace of hearts
\')
    end
  end
'''
  #true case
  describe '.is_a_flush' do
    it "Responds with a boolean based on if the values are a flush" do
      expect(hand.is_a_flush?).to eq(true)
    end
  #false case
    it "Responds with a boolean based on if the values are a flush" do
      expect(hand1.is_a_flush?).to eq(false)
    end
  end
  #true case
  describe '.is_a_straight' do
    it "Responds with a boolean based on if the values are a straight" do
      expect(hand.is_a_straight?).to eq(true)
    end
    #false case
    it "Responds with a boolean based on if the values are a straight" do
      expect(hand1.is_a_straight?).to eq(false)
    end
  end
  #true case
  describe '.is_a_pair?' do
    it "tells if their is a pair in the hand" do
      expect(hand1.is_a_pair?).to eq(true)
    end
  end
  #false case
  describe '.is_a_pair?' do
    it "tells if their is a pair in the hand" do
      expect(hand.is_a_pair?).to eq(false)
    end
  end
  #true case
  describe '.is_three_ofak?' do
    it "tells if their is three of a kind in the hand" do
      expect(hand1.is_three_ofak?).to eq(true)
    end
  end
  #false case
  describe '.is_three_ofak?' do
    it "tells if their is three of a kind in the hand" do
      expect(hand.is_three_ofak?).to eq(false)
    end
  end
  #true case
  describe '.is_a_straigth_flush' do
    it 'tells if the hand is a straght flush' do
      expect(hand.is_a_straight_flush?).to eq(true)
    end
  end
  #false case
  describe '.is_a_straight_flush' do
    it 'tells if the hand is a straght flush' do
      expect(hand1.is_a_straight_flush?).to eq(false)
    end
  end
  #true case
  describe '.is_a_royal_flush?' do
    it 'tells if the hand is a straght flush' do
      expect(hand.is_a_royal_flush?).to eq(true)
    end
  end
  #false case
  describe '.is_a_royal_flush?' do
    it 'tells if the hand is a straght flush' do
      expect(hand1.is_a_royal_flush?).to eq(false)
    end
  end
  #true case
  describe '.is_four_ofak?' do
    it 'tells if the hand is four of a kind' do
      expect(hand2.is_four_ofak?).to eq(true)
    end
  end
  #false case
  describe '.is_four_ofak?' do
    it 'tells if the hand is four of a kind' do
      expect(hand.is_four_ofak?).to eq(false)
    end
  end

  #true case
  describe '.is_full_house?' do
    it 'tells if the hand is four of a kind' do
      expect(hand3.is_full_house?).to eq(true)
    end
  end

  #false case
  describe '.is_full_house?' do
    it 'tells if the hand is four of a kind' do
      expect(hand.is_full_house?).to eq(false)
    end
  end

  #true case
  describe '.is_two_pair?' do
    it 'tells if the hand is two pairs of a kind' do
      expect(hand4.is_two_pair?).to eq(true)
    end
  end

  #false case
  describe '.is_two_pair?' do
    it 'tells if the hand is two pairs of a kind' do
      expect(hand1.is_two_pair?).to eq(false)
    end
  end

  #strength of hand test cases

  describe '.strength_of_hand' do
    it 'determines strength of hand using numerical value' do
      expect(hand.strength_of_hand?).to eq(10) #royal flush case
    end
  end

  describe '.strength_of_hand' do
    it 'returns high card when all other values are false' do
      expect(hand5.strength_of_hand?).to eq(1) #none of the functions pass.
    end
  end

end
