require_relative 'card.rb'

class Deck
  
  SUITES = ['♠', '♣', '♥', '♦']
  VALUE = (2..10).to_a
  VALUE << :Jack << :Queen << :King << :Ace
  
  attr_reader :cards

  def initialize
    @cards = create_deck.shuffle!
  end

  def draw(number_of_cards = 1)
    number_of_cards.times.map { @cards.pop }
  end

  def size
    @cards.size
  end

  private

  def create_deck
    deck = []
    SUITES.each do |s|
      VALUE.each do |v|
        deck.push(Card.new(s, v))
      end
    end
    deck
  end
end