require_relative 'Card'

class Deck < Card

  def initilize
    @deck = []
    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace']
    suites = ['hearts', 'clubs', 'spades', 'diamonds']

    ranks.each do |card_rank|
      suites.each do |card_suite|
        @deck.push(Card.new.identity(card_rank, card_suite))
      end
    end
    @deck.shuffle!
  end

end
