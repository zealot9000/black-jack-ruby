require_relative 'card.rb'

class Deck
  attr_reader :deck

  def initialize
    @deck = create_deck
  end

  def draw(number_of_cards = 1)
    drawn_cards = []
    number_of_cards.times do
      drawn_cards << @deck.pop
    end
    drawn_cards
  end

  def size
    @deck.size
  end

  private

  def create_deck
    suite = ['♠', '♣', '♥', '♦']
    value = (2..10).to_a
    value << :Jack << :Queen << :King << :Ace

    deck = []

    suite.each do |s|
      value.each do |v|
        card = Card.new(s, v)
        deck << card
      end
    end
    deck.shuffle!
  end
end

