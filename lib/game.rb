module BlackJack
  class Game
    def initialize
      new_deck
      @players = []
      @bet_amount = 10
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

    def new_deck
      @deck = Deck.new
      @deck.shuffle
      @deck

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
