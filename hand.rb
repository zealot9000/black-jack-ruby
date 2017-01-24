class Hand
    
  attr_reader :hand_cards
  
  def initialize
    @hand_cards = []
  end
  
  def reset
    @hand_cards.clear
  end
  
  def print_hand
    @hand_cards.each do |cards|
      puts "#{ @name } cards: #{ cards.value } #{ cards.suit }"
    end
  end
  
  def hand_full?
    if @hand_cards.length == 3
      true
    else
      false
    end  
  end  

  def card_sum
    card_sum = 0
    @hand_cards.each do |card|
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
end  