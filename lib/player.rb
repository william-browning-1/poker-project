require_relative 'Hand'

$players = []

class Player < Hand
  attr_accessor :chips, :hand, :id
  def initialize(chips, id, hand)
    @chips = chips
    @id = id
    @hand = hand
  end

  def turn(player)
    puts "Player #{player.id}'s Turn:\n\n"
    if @player_turns >= @num_players
      new_cards = draw_hand(player, @current_deck)
      puts 'Current hand:'
      player.hand.concat(new_cards)
      puts Hand.new(player.hand).show_hand
    else
      puts Hand.new(player.hand).show_hand
    end

    puts "\n1)See, 2)Raise, or 3)Fold?"
    choice = gets.chomp.to_i
      if choice == 1
        @players << Player.new(player.chips, player.id, player.hand)
      elsif choice == 2 #if player raises raise the inputed value.
        loop do
          puts "\nHow much would you like to raise?"
          choice = gets.chomp.to_i
          begin
            choice = Integer(choice)
            if choice.between?(1, player.chips)
              puts "Adding Raise to the Current Bet"
              @current_bet += choice #updates current bet
              @pot += @current_bet #updates pot
              puts "Pot is #{@pot},
Current Bet is #{@current_bet}"
              break
            elsif choice > player.chips
              puts "You Don't have enough chips
Try Again"
              puts "Pot is #{@pot},
Current Bet is #{@current_bet}"
            else
              puts "Value is not a Positive Integer
Try Again"
            end
          end
        end
        @players << Player.new(player.chips, player.id, player.hand)
      elsif choice == 3 #if player folds give them a nil hand.
        @players << Player.new(player.chips, player.id, nil)
      end
  end

  def draw_hand(player, current_deck)
    puts "Current hand: "
    puts Hand.new(player.hand).show_hand
    puts "\nWhich cards would you like to discard? (e.g., 1 3 5)"

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
