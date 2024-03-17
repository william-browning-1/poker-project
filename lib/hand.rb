require_relative 'Deck'

class Hand < Deck
  attr_accessor :cards, :rank_change, :high_card
  def initialize(cards)
    @cards = cards
    @ranks1 = @cards.map{|card| card.rank}
    @suites = @cards.map{|card| card.suite}

    @rank_change = cards

    face_cards = {'ace' => 14, 'king' => 13, 'queen' => 12, 'jack' => 11}

    @rank_change.each do |card|
      if card.rank.is_a? String
        @rank_change << Card.new(face_cards[card.rank], card.suite)
      end
    end

    @rank_change = @rank_change.select {|card| (card.rank).is_a? Integer}
    @ranks = @rank_change.map{|card| card.rank}

    @high_card = @ranks.max


  end

  def show_hand
    display = []
    @cards.slice!(0, 5).each do |card|
      display << "#{card.rank} of #{card.suite}\n"
    end
    return display.join('      ')
  end

  def strength_of_hand?
    if is_a_royal_flush?
      strength = 10
    elsif is_a_straight_flush?
      strength = 9
    elsif is_four_ofak?
      strength = 8
    elsif is_full_house?
      strength = 7
    elsif is_a_flush?
      strength = 6
    elsif is_a_straight?
      strength = 5
    elsif is_three_ofak?
      strength = 4
    elsif is_two_pair?
      strength = 3
    elsif is_a_pair?
      strength = 2
    else
      strength = 1
    end
  end

  def is_a_royal_flush?
    return true if @ranks.sort!.eql?([10, 11, 12, 13, 14]) and is_a_flush?
    false
  end

  def is_a_straight_flush?
    return true if is_a_flush? and is_a_straight?
    false
  end


  def is_a_flush?
    return true if @suites.uniq.length.eql?(1)
    false
  end

  def is_full_house?
    return true if @ranks.uniq.length.eql?(2)
    false
  end

  def is_a_straight?
    @ranks = @ranks.sort!
    cnt_1 = 0
    @ranks.each_cons(2) do |card_1, card_2|
      if card_1.eql?(card_2 - 1)
        cnt_1 += 1
      end
    end
    return false if cnt_1 < 4
    true
  end

  def is_a_pair?
    @ranks.each do |rank|
      if @ranks.count(rank) >= 2
        return true
      end
    end
    false
  end

  def is_two_pair?
    return true if @ranks.uniq.length.eql?(3) and not(is_three_ofak?)
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

  def is_four_ofak?
    @ranks.each do |rank|
      if @ranks.count(rank) == 4
        return true
      end
    end
    false
  end

end
