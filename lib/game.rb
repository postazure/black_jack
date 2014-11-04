module BlackJack
  class Game
    def initialize
      @deck = Deck.new
      @deck.shuffle

      @players = []
      @winner = ""
    end

    def add_player
      @players.push(Player.new)
    end

    def over?
      game_over = false

      @players.each_with_index do |player, i|

        if player.hand.bust?
          game_over = true
          @winner = (i-1).to_s #flips to other player
        end
      end

      game_over
    end

    def winner
      "Player #{@winner}"
    end

    def players
      @players
    end

    def deck
      @deck
    end

    def new_game
      deck = self.deck

      self.add_player
      self.add_player

      player0 = self.player[0]
      player1 = self.player[1]

      puts "%"*40
      puts "...:New Game:..."
      while !self.over
        puts "Player 0's Hand Value: #{player0.hand.values}."
        puts player0.hand
        puts

        puts "Player 1's Hand Value: #{player1.hand.values}."
        puts player1.hand
        puts

        self.player.each do |player|
          hand = player.hand

          if hand.hit?
            card = deck.deal
            player.hand.add(card)
          end

        end

      end

      puts "#{self.winner} is the winner."

    end

  end

end
