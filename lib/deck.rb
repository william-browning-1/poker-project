require_relative 'Card'

class Deck < Card
    attr_reader :deck, :hand
    def initialize
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

    def random_cards
      hand = []
      [0,1,2,3,4].each do |card|
        hand << @deck[0]
        @deck.delete(@deck[0])
      end
      hand
    end

    def deal_cards(num_players)
      player_hands = []
      (0...num_players).each do |card|
        player_hands << random_cards
      end
      player_hands
    end

end
