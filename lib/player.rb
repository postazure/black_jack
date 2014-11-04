
module BlackJack
  class Player < Game
    def initialize
      @hand = Hand.new

      @hand.add(game.get_deck.deal)
      @hand.add(game.get_deck.deal)
    end

    def hand
      @hand
    end


  end
end
