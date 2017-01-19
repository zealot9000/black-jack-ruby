class Deck
   
  attr_reader :deck 
   
  def initialize
    @deck = ['a', 'b', 'c']
    deck.shuffle!
  end

  
  private
  
  attr_writer :deck
  
    
end    