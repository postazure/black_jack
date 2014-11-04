module BlackJack
  class Deck
    def initialize

      suits = ['heart', 'spade', 'diamond', 'club']
      faces = (2..10).to_a + ['J', 'Q', 'K', 'A']

      @deck = []

      suits.each do |suit|
        faces.each do |face|
          @deck << Card.new(suit, face)
        end
      end
    end

    def shuffle
      @deck.shuffle!
    end

    def deal
      @deck.pop
    end


    def size
      @size = @deck.length
    end

    def cards
      @deck
    end


  end
end
