class Player
  attr_reader :name, :money, :hand

  def initialize(name)
    @name = name
    @money = START_MONEY
    @hand = []
  end

  def print_hand
    @hand.each do |cards|
      puts "#{ @name } cards: #{ cards.value } #{ cards.suit }"
    end
  end

  def make_rate
    @money -= 10
  end

  def reset
    @hand.clear
  end

  def card_sum
    card_sum = 0
    @hand.each do |card|
      card_sum += if card.value.is_a?(Symbol) && card.value != :Ace
                    10
                  elsif card.value == :Ace
                    card_sum + 10 <= 21 ? 10 : 1
                  else
                    card.value
                  end
    end
    card_sum
  end

  def add_money(value)
    @money += value
  end

  private

  START_MONEY = 100

  attr_writer :name, :money, :hand
end