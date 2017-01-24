require_relative 'deck.rb'
require_relative 'player.rb'

class BlackJack
  
    BANK = 20
    
  def initialize
    @computer = Player.new('Computer')
    @deck = Deck.new
  end

  def start_game
    create_player
    loop do
      game_reset
      first_draw
      loop do
        player_info
        print_menu
        break if @player.hand.size == 3 || @computer.hand.size == 3

        choice = gets.chomp.to_i
        case choice
          when 1
            @player.hand.push(*@deck.draw(1)) if @player.hand.size < 3
            computer_step
          when 2
            computer_step
          when 3
            computer_step
          break
        end

      end
      print_win_menu
      choice = gets.chomp.to_i
      break if choice == 2
    end
  end

  private

  def create_player
    puts 'Hello! Welcome to Black Jack!'
    puts 'Enter your name, please: '

    @player = Player.new(gets.chomp.capitalize)
  end  

  def computer_cards(text='*', n=@computer.hand.size)
    print "Computer has cards: #{ text * n } "
  end

  def game_reset
    @player.reset
    @computer.reset
    make_rate
  end

  def first_draw
    @player.hand.push(*@deck.draw(2))
    @computer.hand.push(*@deck.draw(2))
  end 

  def make_rate
    @player.make_rate
    @computer.make_rate
  end

  def computer_step
    @computer.hand.push(*@deck.draw(1)) if @computer.card_sum < 18 && @computer.hand.size < 3
  end

  def who_win
    player = @player.card_sum
    computer = @computer.card_sum
    if player > 21
      @computer.add_money(BANK)
      @computer.name
    elsif computer > 21 || player > computer
      @player.add_money(BANK)
      @player.name
    elsif computer == player
      @player.add_money(10)
      @computer.add_money(10)
      'Draw!'
    else
      @computer.add_money(BANK)
      @computer.name
    end
  end

  def print_menu
    puts "Select an action, #{@player.name}: "
    puts '--------------------------------------------------'
    puts '1. Take a card'
    puts '2. Pass'
    puts '3. Show down'
    puts '--------------------------------------------------'
  end

  def player_info
    puts @player.print_hand.to_s
    puts "Your card sum: #{@player.card_sum}"
    puts "Your money: #{@player.money}$"
    puts computer_cards
  end

  def print_win_menu
    puts "-= Win: #{who_win} =-"
    puts "#{@player.name} cards: #{@player.print_hand}"
    puts computer_cards
    puts "#{@player.name} cards sum: #{@player.card_sum}"
    puts "#{@computer.name} cards sum: #{@computer.card_sum}"
    puts '--------------------------------------------------'
    puts '1. Another game'
    puts '2. Exit'
    puts '--------------------------------------------------'
  end     
end