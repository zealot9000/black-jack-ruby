require_relative 'deck.rb'
require_relative 'player.rb'
require_relative 'computer.rb'

computer = Computer.new
deck = Deck.new

puts "Enter the name of the player: "

player = Player.new(gets.chomp)

player.first_rate
computer.first_rate
BANK = 20

player.hand << deck.draw(2)
computer.hand << deck.draw(2)

# puts "Computer cards: #{computer.player_hand_count}"

puts "Player hand: #{player.print_hand}"
puts "Player card sum: #{player.card_sum}"

#puts deck.show_deck.get_value

