require_relative 'deck.rb'
require_relative 'player.rb'
require_relative 'computer.rb'

computer = Computer.new
deck = Deck.new

puts "Enter the name of the player: "

player = Player.new(gets.chomp)

player.first_rate
computer.first_rate
bank |= 20

player.player_deck << deck.first_draw
computer.player_deck << deck.first_draw

puts player.player_deck
puts player.money
puts computer.player_deck
puts bank
puts deck.deck

