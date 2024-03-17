require_relative 'Deck'

class Hand < Deck
  attr_accessor :cards, :rank_change
  def initialize(cards)
    @cards = cards
    @ranks = @cards.map{|card| card.rank}
    @suites = @cards.map{|card| card.suite}

    @rank_change = @cards

    face_cards = {'ace' => 14, 'king' => 13, 'queen' => 12, 'jack' => 11}

    @rank_change.each do |card|
      if card.rank.is_a? String
        @rank_change << Card.new(face_cards[card.rank], card.suite)
      end
    end

    @rank_change = @rank_change.select {|card| (card.rank).is_a? Integer}



     print @rank_change
     @ranks = @rank_change.map{|card| card.rank}
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
    false
  end


end
