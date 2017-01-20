require_relative 'deck.rb'
require_relative 'player.rb'
require_relative 'computer.rb'


bank = []

computer = Computer.new
deck = Deck.new

puts "Введите имя игрока: "


player = Player.new(gets.chomp)

player.player_deck << deck.first_distribution
computer.player_deck << deck.first_distribution




puts player.player_deck
puts computer.player_deck
puts deck.deck