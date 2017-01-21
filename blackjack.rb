require_relative 'deck.rb'
require_relative 'player.rb'

class BlackJack
  def initialize
    @computer = Player.new('Computer')
    @deck = Deck.new
  end

  def start_game
    puts 'Hello! Welcome to Black Jack!'
    puts 'Enter your name, please: '

    @player = Player.new(gets.chomp.capitalize)

    loop do
      game_reset
      first_draw
      loop do
        puts @player.print_hand.to_s
        puts "Your card sum: #{@player.card_sum}"
        puts "Your money: #{@player.money}$"

        puts "Select an action, #{@player.name}: "
        puts '1. Take a card'
        puts '2. Check'
        puts '3. Show down'
        puts '--------------------------------------------------'

        choice = gets.chomp.to_i

        case choice
        when 1
          @player.hand << @deck.draw if @player.hand.size < 3
          computer_step
        when 2
          computer_step
        when 3
          computer_step
          break
        end
      end

      puts "-= Win: #{who_win} =-"
      puts "#{@player.name} cards: #{@player.print_hand}"
      puts "#{@computer.name} cards: #{@computer.print_hand}"
      puts "#{@player.name} cards sum: #{@player.card_sum}"
      puts "#{@computer.name} cards sum: #{@computer.card_sum}"
      puts '1. Another game'
      puts '2. Exit'
      puts '--------------------------------------------------'
      choice = gets.chomp.to_i
      break if choice == 2
    end
    end

  private

  BANK = 20

  def game_reset
    @player.reset
    @computer.reset
    set_rate
  end

  def first_draw
    @player.hand << @deck.draw(2)
    @computer.hand << @deck.draw(2)
  end

  def set_rate
    @player.set_rate
    @computer.set_rate
  end

  def computer_step
    @computer.hand << @deck.draw if @computer.card_sum < 18 && @computer.hand.size < 2
  end

  def who_win
    player = @player.card_sum
    computer = @computer.card_sum
    if player > 21
      @computer.set_money(BANK)
      @computer.name
    elsif computer > 21 || player > computer
      @player.set_money(BANK)
      @player.name
    elsif computer == player
      @player.set_money(10)
      @computer.set_money(10)
      'Draw!'
    else
      @computer.set_money(BANK)
      @computer.name
    end
  end
end
