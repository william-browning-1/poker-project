require_relative 'Deck'

class Hand < Deck
  attr_accessor :cards, :rank_change
  def initialize(cards)
    @cards = cards
    @ranks = @cards.map{|card| card.rank}
    @suites = @cards.map{|card| card.suite}

    face_cards = ['ace', 'king', 'queen', 'jack']

    @rank_change = @cards

    @rank_change.each do |card|
      if face_cards.include?(card.rank)
        [0,1,2,3].each do |fc_index|
          @rank_change[@cards.index(card)] = Card.new(14 - fc_index, card.suite)
        end
      end
    end
    print @rank_change
    @ranks = @rank_change.map{|card| card.rank}

    puts
  end

  def show_hand
    @cards.each do |card|
      "#{card.rank} of #{card.suite}"
    end
  end

  def is_a_flush?
    return false if @suites.uniq.length > 1
    true
  end

  def is_a_straight?
    @ranks.sort!
    @ranks.each_cons(2).all? {|card_1, card_2| card_2 = card_1 + 1}
  end

  def is_a_pair?
    @ranks.each do |rank|
      if @ranks.count(rank) >= 2
        return true
      end
    end
    false
  end

  def is_three_ofak?
    @ranks.each do |rank|
      if @ranks.count(rank) >= 3
        return true
      end
    end
  end


end
