require_relative 'Player'

class Game < Player
  attr_accessor :num_players, :current_deck, :players
  def initialize
    puts "Welcome to Poker! How many players are there?"
    @num_players = gets.chomp.to_i

    while !@num_players.between?(2,6)
      puts "Value Error: must be 2-6 players,
Try Again:"
      @num_players = gets.chomp.to_i
    end

    puts "\nInitializing Players...\n\n"

    puts "Each player starts with 200 chips\n\n"
    starting
    start_round(1)
  end

  def starting
    @players = []
    (0...@num_players).each do |player|
      @players.push(Player.new(200, player + 1, nil)) #hand starts as a nil value.
    end
  end

  def find_last_instance  #finds the last time a value was entered for a player.id in @players
    @player_save = []
    last_instances = {}
    @players.reverse.each do |player|
      if !last_instances.key?(player.id)
        last_instances[player.id] = { chips: player.chips, id: player.id}
      end
    end
    last_instances.values.each do |player|
      @player_save << Player.new(player[:chips], player[:id], nil)
    end
    @players = @player_save
  end

  def start_round(round_number)  #starts each round with new deck
    if round_number.eql?(1)  #initial round
      starting
    else
      find_last_instance  #runs the function to delete un-needed values from @players.
    end
    puts "\nShuffling..."
    @current_deck = Deck.new #new deck for every round
    puts "\nDealing...\n\n" #changes @players back to three players.
    @players.each do |player|  #distributes hands
      player.hand = @current_deck.random_cards(5)
    end

    @pot = 0
    puts "Initial Bets are 10 chips each:\n"
    @players.each do |player| #create ante game based on number of players
      @pot += 10
      player.chips = player.chips - 10
    end
    @current_bet = @pot
    puts "\nStarting bet is #{@current_bet}\n"

    @player_turns = 0
    @count = @num_players
    final = 0
    @players.each do |player|
      if player.hand != nil
        if @count != 1
            if @player_turns < @num_players
            puts "\n\n(First Round)\n\n"
            turn(player)
            @player_turns += 1
          elsif @player_turns.between?(@num_players, (@count * 2) - 1)
            puts "\n\n(Draw Round)\n\n"
            turn(player)
            @player_turns += 1
          elsif @player_turns.between?(@count * 2, (@count * 3) - 1) and final < @count
            puts "\n\n(Final Round)\n\n"
            turn(player)
            @players << Player.new(player.chips, player.id, player.hand)
            final += 1
          else #compares hands at the end of the final round
            puts Hand.new(player.hand)
            start_round(round_number + 1)
          end
        else
          winning_round(player)
          start_round(round_number + 1)
        end
      end
    end
  end


  def winning_round(player) #when a player wins a round they win the pot
    puts "\n\nPlayer #{player.id} wins the pot!!!\n\n"
          player.chips = player.chips + @pot
  end
end
game_1 = Game.new
