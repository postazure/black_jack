
module BlackJack
  class Player
    def initialize risk, name
      @chip_count = 1000
      @risk = risk
      @name = name
    end

    def hand
      @hand
    end

    def name
      @name
    end

    def bet amount
      @chip_count -= amount
      amount
    end

    def place_bets bet_amount
      bet bet_amount
    end

    def get_chips amount
      @chip_count += amount
    end

    def chip_count
      @chip_count
    end

    def risk
      @risk
    end

    def reset_hands deck
      @hand = Hand.new
      hand.add(deck.deal)
      hand.add(deck.deal)
    end
    
  end
end
