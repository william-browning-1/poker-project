require_relative 'Card'
require_relative 'Player'

class Deck < Card
    attr_accessor :deck
    def initialize
      @deck = []
      ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace']
      suites = ['hearts', 'clubs', 'spades', 'diamonds']

      ranks.each do |card_rank|  #makes deck
        suites.each do |card_suite|
          @deck.push(Card.new(card_rank, card_suite))
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
