require_relative 'Hand'

class Player < Hand
  attr_accessor :chips, :hand, :id
  def initialize(chips, id, hand)
    @chips = chips
    @id = id
    @hand = hand
  end

  def turn(player)
    if player.chips <=0
      puts "Player #{player.id} is All IN!!"
      @players << Player.new(0, player.id, player.hand) #saves hand but makes chip count 0.
    else
      puts "Player #{player.id}'s Turn:\n\nChip Count: #{player.chips}\n\n"
      if @player_turns.between?(@num_players, (@count * 2) - 1) #draw round
        new_cards = draw_hand(player, @current_deck)
        puts "Current hand:\n"
        player.hand.concat(new_cards)
        puts Hand.new(player.hand).show_hand
      else #first round, final round
        puts Hand.new(player.hand).show_hand
      end
      see_raise_fold(player)
    end
  end

  def see_raise_fold(player)
    loop do
      puts "\n1)See, 2)Raise, or 3)Fold?"
      choice = gets.chomp.to_i
      begin
        if choice == 1 #sees bet
          @players << Player.new(player.chips - @current_bet, player.id, player.hand) #used to continue iterating
          break
        elsif choice == 2 #if player raises raise the inputed value.
          loop do
            puts "\nHow much would you like to raise?\n"
            choice = gets.chomp.to_i
            begin
              choice = Integer(choice)
              if choice.between?(1, player.chips)
                puts "Adding Raise to the Current Bet\n\n"
                @current_bet += choice #updates current bet
                @players << Player.new(player.chips - @current_bet, player.id, player.hand)
                @pot += @current_bet #updates pot
                puts "Pot is #{@pot}, \nCurrent Bet is #{@current_bet}\n\n"
                break
              elsif choice > player.chips
                puts "You Don't have enough chips, \nTry Again"
                puts "Pot is #{@pot},\nCurrent Bet is #{@current_bet}\n\n"
              else
                puts "Value is not a Positive Integer, \nTry Again\n\n"
              end
            end
          end
          break
        elsif choice == 3 #if player folds give them a nil hand.
          @players << Player.new(player.chips, player.id, nil)
          @count -= 1
          break
        else
          puts "Invalid Input, \nTry Again"
        end
      end
    end
  end


  def draw_hand(player, current_deck)
    puts "Current hand: "
    puts Hand.new(player.hand).show_hand
    puts "\nWhich cards would you like to discard? \"Enter\" to skip. (e.g., 1 3 5)"

    choices = gets.chomp.split.map(&:to_i)
    while !choices.all? { |choice| (1..5).include?(choice) } || choices.length > 3
      puts "Invalid input! Please enter the numbers of up to three cards to discard: "
      choices = gets.chomp.split.map(&:to_i)
    end

    choices.sort.reverse.each do |index|
      player.hand.delete_at(index - 1)
    end

    discarded_count = choices.length
    player.hand.concat(current_deck.random_cards(discarded_count))
  end

  def show_hand_draw(player)
    puts "Current Hand:"
    player.hand = player.hand.select {|card| card.rank.is_a? String or card.rank <= 10}
    display = []
    index = 1
    player.hand.slice!(0, 5).each do |card|
      display << "#{index}) #{card.rank} of #{card.suit}\n"
      index += 1
    end
    puts display.join('')
  end
end
