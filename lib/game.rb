module BlackJack
  class Game
    def initialize
      @deck = Deck.new.shuffle
    end

    def get_deck
      @deck
    end
  end

end
