class Player
  attr_reader :name, :money, :hand

  def initialize(name)
    @name = name
    @money = 100
    @hand = []
  end

  def player_hand_count
    hand.count + 1
  end

  def print_hand
    @hand.each do |array|
      array.each do |card|
        puts "#{name} card: #{card.value} #{card.suit}"
      end
    end
  end

  def set_rate
    @money -= 10
  end

  def reset
    @hand = []
  end

  def card_sum
    card_sum = 0
    @hand.each do |array|
      array.each do |card|
        card_sum += if card.value.is_a?(Symbol) && card.value != :Ace
                      10
                    elsif card.value == :Ace
                      card_sum + 10 <= 21 ? 10 : 1
                    else
                      card.value
                    end
      end
    end
    card_sum
  end

  def set_money(value)
    @money += value
  end

  private

  attr_writer :name, :money, :hand
end
