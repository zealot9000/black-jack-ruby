class Player
    
  attr_reader :name, :money, :hand
    
  def initialize(name)
    @name = name
    @money = 100
    @hand = []
  end 
   
  def first_rate
    @money -= 10
  end  

  def player_hand_count
    self.hand.count + 1
  end 

  def print_hand
    @hand.each do |array|
      array.each do |card|
        puts "Your card: #{card.value} #{card.suit}"
      end  
    end  
  end

  def card_sum
    card_sum = 0
    @hand.each do |array|
      array.each do |card|
        if card.value.is_a?(Symbol) && card.value != :Ace
          card_sum += 10  
        elsif card.value == :Ace
          card_sum + 10 <= 21 ? card_sum +=10 : card_sum += 1  
        else  
          card_sum += card.value
        end            
      end   
    end
    card_sum 
  end  
   
  private
   
  attr_writer :name, :money, :hand
end    