module BlackJack
  class Game
    def initialize

      @players = []
      @bet_amount = 10
    end

    def add_player risk, name
      @players.push(Player.new(risk, name))
    end

    def get_players(num)
      @number_of_players = num
      names = ["Jimmy", "Dean", "Tommy"]
      if num <= names.length
        num.times do |i|
          add_player(rand(11..17), names[i])
        end
      else
        num.times do |i|
          add_player(rand(11..18), "Player#{1+i}")
        end
      end
      new_deck
    end

    def over?
      game_over = false

      @players.each do |player|
        if player.hand.bust?
          game_over = true
        end
      end

      game_over
    end

    def new_deck
      @deck = Deck.new(@number_of_players); @deck.shuffle
      @deck
    end

    def reset_deck
      if @deck.size < 10*@number_of_players
        puts "Shuffle Deck | Remaining Cards:#{@deck.size}"
        @deck = new_deck
      end
      @deck
    end

    def hand_status
      puts "-"*15

      @players.each do |player|
        print "#{player.name}'s Hand "
        player.hand.cards.each do |card|
          print "#{card.face}#{card.suit} "
        end
        puts "Value: #{player.hand.values.join(" or ")}."
      end
    end

    def get_winner
      highest_value = {}
      @players.each do |player|
        highest_value[player] = player.hand.values.max
      end

      high_key = []
      highest_value.each {|key, value| high_key << value}

      winning_players = []
      highest_value.each do |key, value|
        if value == high_key.max
          winning_players << key
        end
      end
      winning_players
    end

    def declare_winners
      winning_players = get_winner
      pot_payout = (@bet_amount*@players.length)/winning_players.length
      winning_players.each {|player| player.get_chips(pot_payout)}


      if winning_players.length == 1
        puts "\n#{winning_players.first.name}'s hand wins | Winnings: #{pot_payout}"
      else
        name_list = winning_players.map {|player| player.name}
        print name_list.join(", ")
        puts "\n Push | Winnings: #{pot_payout}"
      end

      @players.each do |player|
        if player.chip_count < 10
          @players.delete(player)
        end
      end
    end

    def leader_board
      leader_board = @players.map do |player|
        "#{player.name} Chips:#{player.chip_count}"
      end
      puts "\n#{leader_board.join("|")}"
    end

    def players
      @players
    end

    def deck
      @deck
    end

    def bet_amount
      @bet_amount
    end
  end
end
