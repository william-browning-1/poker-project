require_relative 'Card'

class Deck < Card
    $deck = []
    $ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace']
    $suites = ['hearts', 'clubs', 'spades', 'diamonds']

    $ranks.each do |card_rank|
      $suites.each do |card_suite|
        $deck.push(Card.new.identity(card_rank, card_suite))
      end
    end

    def shuffle_deck
      $deck.shuffle()
      $deck.length
    end
end
