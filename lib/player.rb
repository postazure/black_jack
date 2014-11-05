
module BlackJack
  class Player
    def initialize risk
      redeal
      @chip_count = 1000
      @risk = risk

    end

    def hand
      @hand
    end

    def bet amount
      @chip_count -= amount
      amount
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


    def redeal
      @hand = Hand.new
    end



  end
end
