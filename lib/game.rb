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



    def players
      @players
    end

    def deck
      @deck
    end

  end

end
