module BlackJack
  class Card
    def initialize suit, face
      @suit = suit
      @face = face
    end

    def suit
      @suit
    end

    def face
      @face
    end

    def values
      rank_dict = {'A' => [1,11],
        'J' => [10], 'Q' => [10], 'K' => [10]}
      if @face =~ /[A-Z]/
        @face = rank_dict[@face]
      else
        @face = [@face.to_i]
      end
      @face
    end

    def face
      @face
    end

    def suit
      @suit
    end


    def == other_card

      (@face == other_card.face && @suit == other_card.suit)
    end
  end
end
