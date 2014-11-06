module BlackJack
  class Deck
    def initialize num_of_decks = 2
      @count = num_of_decks
      build_deck

    end

    def build_deck
      heart =   "\u2661".encode('utf-8')
      spade =   "\u2664".encode('utf-8')
      diamond = "\u2662".encode('utf-8')
      club =    "\u2667".encode('utf-8')
      suits = [heart, spade, diamond, club]

      faces = (2..10).to_a + ['J', 'Q', 'K', 'A']

      @deck = []

      @count.times do |i|
        suits.each do |suit|
          faces.each do |face|
            @deck << Card.new(suit, face)
          end
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
      @deck.length
    end

    def count
      @count
    end

    def cards
      @deck
    end


  end
end
