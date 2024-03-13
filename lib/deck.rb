require_relative 'Card'

class Deck < Card

  def create_deck
    deck = []

    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace']
    suites = ['hearts', 'clubs', 'spades', 'diamonds']
    card_num = 0

    ranks.each do |card_rank|
      suites.each do |card_suite|
        deck.push(Card.new.identity(card_rank, card_suite))
        card_num += 1
      end
    end
    card_num
  end

end

Deck_1 = Deck.new
Deck_1.create_deck
