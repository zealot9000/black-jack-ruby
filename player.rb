#require_relative 'computer.rb'

class Player
    
  attr_reader :name, :money, :player_deck
    
  def initialize(name)
    @name = name
    @money = 100
    @player_deck = []
  end 
   
   
  private
   
  attr_writer :name, :money, :player_deck
   
end    

  