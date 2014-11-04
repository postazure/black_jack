require 'spec_helper'

describe BlackJack::Card do
  let(:card) { BlackJack::Card.new(suit, face) }
  let(:suit) { :heart }
  let(:face) { 'J' }

  describe 'initialized values' do
    it "reports them publicly" do
      expect(card.suit).to be == suit
      expect(card.face).to be == face
    end
  end

  describe '#values' do
    context 'when the face is a number' do
      let(:face) { '6' }

      it "returns that number in an array" do
        expect(card.values).to be == [6]
      end
    end

    context 'when face is an ace' do
      let(:face) { 'A' }

      it "returns both 11 and 1" do
        expect(card.values).to be == [1, 11]
      end
    end

    context 'when the face is another court card' do
      context "when 'J'" do
        let(:face) { 'J' }

        it "should be an array with only 10" do
          expect(card.values).to be == [10]
        end
      end

      context "when 'Q'" do
        let(:face) { 'Q' }

        it "should be an array with only 10" do
          expect(card.values).to be == [10]
        end
      end

      context "when 'K'" do
        let(:face) { 'K' }

        it "should be an array with only 10" do
          expect(card.values).to be == [10]
        end
      end
    end
  end

  describe '#==' do
    context "when two cards have different values and suits" do
      let(:card_1) { BlackJack::Card.new(suit, '3') }
      let(:card_2) { BlackJack::Card.new(suit, '2') }

      it "should not be ==" do
        expect(card_1 == card_2).to be false
      end
    end

    context "when two cards have the same value, but different suits" do
      let(:card_1) { BlackJack::Card.new(:heart, face) }
      let(:card_2) { BlackJack::Card.new(:spade, face) }

      it "should not be ==" do
        expect(card_1 == card_2).to be false
      end
    end

    context "when two cards have same suits, but different values" do
      let(:card_1) { BlackJack::Card.new(suit, face) }
      let(:card_2) { BlackJack::Card.new(suit, face) }

      it "should not be ==" do
        expect(card_1 == card_2).to be true
      end
    end
  end
end
