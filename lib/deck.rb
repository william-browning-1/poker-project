require_relative 'Card'

class Deck < Card
    attr_accessor :deck
    def initialize
      @deck = []
      ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace']
      suits = ['hearts', 'clubs', 'spades', 'diamonds']

      ranks.each do |card_rank|  #makes deck
        suits.each do |card_suit|
          @deck.push(Card.new(card_rank, card_suit))
        end
      end
      @deck = @deck.shuffle! #auto shuffles deck.
    end

    def random_cards
      hand = @deck.take(5)
      @deck = @deck - hand
      hand
    end
end
