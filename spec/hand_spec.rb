require 'spec_helper'

describe BlackJack::Hand do
  # before do
  #   pending("do this spec after Deck is complete")
  # end

  let(:hand) { BlackJack::Hand.new }

  describe 'on initialization' do
    it "starts out empty" do
      expect(hand.empty?).to be == true
    end

    it "has a values array that is empty" do
      expect(hand.values).to be_empty
    end
  end

  describe '#add' do
    it "increases the size of the hand" do
      hand.add(BlackJack::Card.new(:heart, 'Q'))
      expect(hand.size).to be == 1
      hand.add(BlackJack::Card.new(:heart, 'K'))
      expect(hand.size).to be == 2
    end
  end

  describe '#values' do
    # the goal of our values method is to return all the possible
    # but unique sums of the cards values

    context 'when only one card' do
      context 'when it is a non-ace card' do
        it "is an array of size 1" do
          hand.add(BlackJack::Card.new(:heart, '10'))
          expect(hand.size).to be == 1
        end
        it "includes the value of the card" do
          hand.add(BlackJack::Card.new(:heart, '10'))
          expect(hand.values).to be == [10]
        end
      end

      context 'when it is an ace' do
        it "is the same as the card.values" do
          hand.add(BlackJack::Card.new(:heart, 'A'))
          expect(hand.size).to be == 1
        end
        it "includes the value of the card" do
          hand.add(BlackJack::Card.new(:heart, 'A'))
          expect(hand.values).to be == [1,11]
        end


      end
    end

    context 'when two cards' do
      context 'when neither is an ace' do
        it "is an array with length 1" do
          hand.add(BlackJack::Card.new(:heart, '5'))
          expect(hand.values.size).to be == 1
        end
        it "includes the sum of the two card values" do
          hand.add(BlackJack::Card.new(:heart, '5'))
          hand.add(BlackJack::Card.new(:heart, '6'))
          expect(hand.values).to be == [11]


        end
      end

      context 'when both are aces' do
        it "is an array with length 3" do
          hand.add(BlackJack::Card.new(:heart, 'A'))
          hand.add(BlackJack::Card.new(:spade, 'A'))
          expect(hand.values.size).to be == 3
        end
        it "includes 2" do
          hand.add(BlackJack::Card.new(:heart, 'A'))
          hand.add(BlackJack::Card.new(:spade, 'A'))
          expect(hand.values).to include(2)
        end
        it "includes 12" do
          hand.add(BlackJack::Card.new(:heart, 'A'))
          hand.add(BlackJack::Card.new(:spade, 'A'))
          expect(hand.values).to include(12)
        end
        it "includes 22" do
          hand.add(BlackJack::Card.new(:heart, 'A'))
          hand.add(BlackJack::Card.new(:spade, 'A'))
          expect(hand.values).to include(22)
        end
      end

      context 'when only one is an ace' do
        it "is an array of length two" do
          hand.add(BlackJack::Card.new(:heart, 'A'))
          expect(hand.values.length).to be == 2
        end
        it "includes a value that is 1 more than the non-ace card value" do
          hand.add(BlackJack::Card.new(:heart, 'A'))
          hand.add(BlackJack::Card.new(:heart, '2'))
          expect(hand.values).to include(3)
        end
        it "includes a value that is 11 more than the non-ace card value" do
          hand.add(BlackJack::Card.new(:heart, 'A'))
          hand.add(BlackJack::Card.new(:heart, '2'))
          expect(hand.values).to include(13)
        end
      end
    end

    # stretch exercises
    context 'when three cards' do
      it "should have only 1 value" do
        hand.add(BlackJack::Card.new(:spade, '2'))
        hand.add(BlackJack::Card.new(:heart, '2'))
        hand.add(BlackJack::Card.new(:heart, '3'))
        expect(hand.values.length).to be == 1
      # what are the cases to consider?
      # write specs and make it go
      end
    end
    context 'when three cards and one is an Ace' do
      it "should have 2 values with and Ace" do
        hand.add(BlackJack::Card.new(:spade, 'A'))
        hand.add(BlackJack::Card.new(:heart, '2'))
        hand.add(BlackJack::Card.new(:heart, '3'))
        expect(hand.values.length).to be == 2
      end
    end
    context 'when three cards and 2 are an Ace' do
      it "should have 2 values with and Ace" do
        hand.add(BlackJack::Card.new(:spade, 'A'))
        hand.add(BlackJack::Card.new(:heart, 'A'))
        hand.add(BlackJack::Card.new(:club, 'A'))
        expect(hand.values.length).to be == 4
      end
    end
  end

  describe '#bust?' do
    context 'when the values are all greater than 21' do
      it "is true" do
        hand.add(BlackJack::Card.new(:spade, '10'))
        hand.add(BlackJack::Card.new(:heart, '10'))
        hand.add(BlackJack::Card.new(:club, '10'))
        expect(hand.bust?).to be true
      end
    end
    context 'when the values are all greater than 21' do
      it "is true" do
        hand.add(BlackJack::Card.new(:spade, '10'))
        hand.add(BlackJack::Card.new(:heart, '10'))
        hand.add(BlackJack::Card.new(:club, '10'))
        hand.add(BlackJack::Card.new(:club, 'A'))
        expect(hand.bust?).to be true
      end
    end

    context 'when none of the values are greater than 21' do
      it 'is false' do
        hand.add(BlackJack::Card.new(:club, '10'))
        hand.add(BlackJack::Card.new(:spade, '10'))
        expect(hand.bust?).to be false
      end
    end

    context 'when any of the values are less than or equal to 21' do

      it "is false" do
        hand.add(BlackJack::Card.new(:club, '10'))
        hand.add(BlackJack::Card.new(:spade, '10'))
        hand.add(BlackJack::Card.new(:club, 'A'))
        expect(hand.bust?).to be false
      end
    end
  end

  describe '#hit?' do
    # stretch exercises
    # figure out some rules for suggesting whether this hand should hit (if 13 then Hit)
    context 'hit when 15 or less' do
      it "hits" do
        hand.add(BlackJack::Card.new(:spade, '10'))
        hand.add(BlackJack::Card.new(:club, '2'))
        expect(hand.hit?).to be true
      end
    end
    context 'hit when 15 or less' do
      it "stay" do
        hand.add(BlackJack::Card.new(:spade, '10'))
        hand.add(BlackJack::Card.new(:club, '10'))
        expect(hand.hit?).to be false
      end
    end
    context 'hit when 15 or less and includes an Ace' do
      it "hits" do
        hand.add(BlackJack::Card.new(:spade, '2'))
        hand.add(BlackJack::Card.new(:club, 'A'))
        expect(hand.hit?).to be true
      end
    end
    context 'hit when 15 or less and includes an Ace' do
      it "stay" do
        hand.add(BlackJack::Card.new(:spade, '10'))
        hand.add(BlackJack::Card.new(:club, 'A'))
        expect(hand.hit?).to be false
      end
    end
    # check the internet or come up with your own ways to make this assessment
    #
    # write tests
    # make them pass
    # do this one at a time
    # step by step
  end
end
