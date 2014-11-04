require 'spec_helper'

describe BlackJack::Player do
  let(:player) {BlackJack::Player.new }

  describe 'on initialization' do
    it "player hand size should be empty" do

      expect(player.hand.empty?).to be true
    end

    it "had a values array that is empty" do
      expect(player.hand.values).to be_empty
    end

  end

  describe '#get_cards' do
    context "add specific card to player's hand" do
      it "should increase hand size by 1" do
        player.hand.add(BlackJack::Card.new(:heart,'10'))
        expect(player.hand.size).to be == 1
      end
      it "includes the value of the card" do
        player.hand.add(BlackJack::Card.new(:heart, '10'))
        expect(player.hand.values).to be == [10]
      end
    end
    context "draw random cards from deck" do
      it "it increases the player's hand by 1" do
        deck = BlackJack::Deck.new
        player.hand.add(deck.deal)

        expect(player.hand.size).to be == 1
      end

      it "it increases the player's hand by 2" do
        deck = BlackJack::Deck.new
        player.hand.add(deck.deal)
        player.hand.add(deck.deal)

        expect(player.hand.size).to be == 2
      end
    end


  end
end
