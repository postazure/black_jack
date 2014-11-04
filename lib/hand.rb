module BlackJack
  class Hand
    def initialize
      @hand = []
    end

    def values

      hand_total = []
      sum = [0]

      hand_values = @hand.map { |card_obj| card_obj.values}

      hand_values.each do |card_val|

        if card_val == [1,11]
          sum = sum.map! {|x| x += 1}

					new_last = sum.last + 10
          sum.push(new_last)

				elsif sum.length != 1
					sum.map! {|slot| slot += card_val[0]}
        else
          sum[0] += card_val[0]

        end

      end

      hand_total = sum unless self.size == 0

      hand_total
    end

    def add card
      @hand.push(card)
    end

    def size
      @hand.count
    end

    def empty?
      @hand.empty?
    end

    def cards
      @hand
    end

		def bust?
			self.values.first > 21 if !self.empty?
		end

		def hit?
			ary = self.values
			hit = true

			ary.each do |value|
				if value.between?(16,21)
					hit = false
				end
			end

			hit
		end


  end
end
