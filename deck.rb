class Deck
   
  attr_reader :deck 
   
  def initialize
    @deck = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
    deck.shuffle!
  end


  def first_distribution
    @deck.shift(2)
  end  
  
  def next_cart
    @deck.shift(0)
  end  
  
  private
  
  attr_writer :deck
  
    
end    