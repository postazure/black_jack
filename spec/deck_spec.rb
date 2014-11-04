require 'spec_helper'

describe BlackJack::Deck do
  # before do
  #   pending("do this spec after Card is complete")
  # end

  let(:deck) { BlackJack::Deck.new }

  describe 'on initialization' do
    it "has 52 cards" do
      expect(deck.size).to be == 52
      card_types = deck.cards.map{|card| card.class}
      expect(card_types.uniq).to be == [BlackJack::Card]
    end
  end

  describe '#shuffle' do
    it "changes the order of the cards" do
      original_deck_order = deck.cards.dup
      shuffled_order = deck.shuffle
      expect(deck.cards).to be == shuffled_order
    end
  end

  describe '#deal' do
    it "decrements the deck size by 1" do
      deck.deal
      expect(deck.size).to be == 51
    end

    it "returns the card" do
      expect(deck.deal).to be_instance_of(BlackJack::Card)
    end

    it "returs nil when all the cards have been dealt" do
      52.times { deck.deal }
      expect(deck.deal).to be == nil
    end
  end
end
