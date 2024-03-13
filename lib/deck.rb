require_relative 'Card'

class Deck < Card
    attr_reader :deck, :hand
    def initialize
      @hand = hand
      @deck = []
      ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace']
      suites = ['hearts', 'clubs', 'spades', 'diamonds']

      ranks.each do |card_rank|
        suites.each do |card_suite|
          @deck.push(Card.new.identity(card_rank, card_suite))
        end
      end
    end

    def shuffle_deck
      @deck.shuffle
    end

    def random_card
      @hand = []
      [0,1,2,3,4].each do |cards|
        card_1 = rand(0...51)
        @hand << @deck[card_1]
        @deck.delete(@deck[card_1])
      end
    end
end
