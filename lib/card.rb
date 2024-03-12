class Card
  attr_accessor :suite, :rank
  def initilize
    @suite = suite
    @rank = rank
  end

  Ranks = { A: 14,
           K: 13,
           Q: 12,
           J: 11,
           ten: 10,
           nine: 9,
           eight: 8,
           seven: 7,
           six: 6,
           five: 5,
           four: 4,
           three: 3,
           two: 2
          }

  Suite = ['Hearts', 'Diamonds', 'Spades', 'Clubs']

    def rank(key)
      Ranks[key]
    end


end
