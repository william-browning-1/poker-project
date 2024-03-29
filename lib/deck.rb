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

    def random_cards(num_cards)  #takes the number of cards entered from the deck and puts them in a list.
      hand = @deck.take(num_cards)
      @deck = @deck - hand
      hand
    end
end
