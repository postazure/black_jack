module BlackJack
  class Game
    def initialize
      @deck = Deck.new
      @deck.shuffle

      @players = []
    end

    def add_player
      @players.push(Player.new)
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

    # def winner
    #   #score
    #   if @player[0].hand.values > @player[1].hand.values
    #     winner = "Player 1 Wins!"
    #   elsif @player[0].hand.values < @player[1].hand.values
    #     winner = "Player 0 Wins!"
    #   else
    #     winner = "PUSH"
    #   end
    #
    #   #bust
    #   if @players[0].hand.bust?
    #     winner = "Player 1 Wins!"
    #   elsif @players[1].hand.bust?
    #     winner = "Player 0 Wins!"
    #   end
    #
    #   winner
    # end

    def players
      @players
    end

    def deck
      @deck
    end

    # def new_game
    #   deck = self.deck
    #
    #   self.add_player
    #   self.add_player
    #
    #   player0 = self.player[0]
    #   player1 = self.player[1]
    #
    #   puts "%"*40
    #   puts "...:New Game:..."
    #   while !self.over
    #     puts "Player 0's Hand Value: #{player0.hand.values}."
    #     puts player0.hand
    #     puts
    #
    #     puts "Player 1's Hand Value: #{player1.hand.values}."
    #     puts player1.hand
    #     puts
    #
    #     self.player.each do |player|
    #       hand = player.hand
    #
    #       if hand.hit?
    #         card = deck.deal
    #         player.hand.add(card)
    #       end
    #
    #     end
    #
    #   end
    #
    #   puts "#{self.winner} is the winner."
    #
    # end

  end

end
