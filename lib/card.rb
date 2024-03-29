class Card
  attr_accessor :rank, :suit
  def initialize(rank, suit) #each card has a rank and a suit
    @rank = rank
    @suit = suit
  end
end
