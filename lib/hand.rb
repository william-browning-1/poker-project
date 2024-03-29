require_relative 'Deck'

class Hand < Deck
  attr_accessor :cards, :high_card
  def initialize(cards)
    @cards = cards

    @ranks1 = @cards.map{|card| card.rank} #all ranks in hand
    @suits = @cards.map{|card| card.suit} #all suits in hand

    @rank_integers = @cards

    face_cards = {'ace' => 14, 'king' => 13, 'queen' => 12, 'jack' => 11}

    @rank_integers.each do |card|
      if card.rank.is_a? String
        @rank_integers << Card.new(face_cards[card.rank], card.suit)
      end
    end

    @rank_integers = @rank_integers.select {|card| (card.rank).is_a? Integer}
    @ranksints = @rank_integers.map{|card| card.rank}  #finds the integer values of the ranks for ace, king, queen, jack.

    @high_card = @ranksints.max
  end

  def show_hand #displays the hand
    @cards = @cards.select {|card| card.rank.is_a? String or card.rank <= 10}
    display = []
    @cards.slice!(0, 5).each do |card|
      display << "#{card.rank} of #{card.suit}\n"
    end
    return display.join('')
  end

  def strength_of_hand? #runs all test to find the highest strength the hand has.
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
    strength
  end

  def is_a_royal_flush?
    return true if @ranksints.sort!.eql?([10, 11, 12, 13, 14]) and is_a_flush? #ranks must be the exact ranks
    false                                                                  #specified to be a royal flush
  end

  def is_a_straight_flush?
    return true if is_a_flush? and is_a_straight?
    false
  end


  def is_a_flush?
    return true if @suits.uniq.length.eql?(1) #only 1 unique suite is a flush
    false
  end

  def is_full_house?
    return true if @ranksints.uniq.length.eql?(2) #only 2 unique ranks will always be a full house
    false
  end

  def is_a_straight?
    @ranksints = @ranksints.sort! #values must be sorted for the following loop to work.
    cnt_1 = 0
    @ranksints.each_cons(2) do |card_1, card_2| #runs through 2 cards at a time.
      if card_1.eql?(card_2 - 1)
        cnt_1 += 1
      end
    end
    return false if cnt_1 < 4
    true #every card must be running in a straight for cnt_1 > 4
  end

  def is_a_pair?
    @ranksints.each do |rank|
      if @ranksints.count(rank) >= 2 #hand is a pair if there is more than one of a single rank.
        return true
      end
    end
    false
  end

  def is_two_pair?
    return true if @ranksints.uniq.length.eql?(3) and not(is_three_ofak?) #hand is two pairs if it has exactly 3 unique
                                                                      #ranks and is not three of a kind.
    false
  end

  def is_three_ofak?
    @ranksints.each do |rank|
      if @ranksints.count(rank) >= 3 #hand is three of a kind if there is more than 2 of a single rank
        return true
      end
    end
    false
  end

  def is_four_ofak?
    @ranksints.each do |rank|
      if @ranksints.count(rank) == 4 #eql to 4 because there cant be more than 4 of one rank.
        return true
      end
    end
    false
  end
end
