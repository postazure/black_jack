# Super-stretch

# Build a game with two robot players guided by your hand class
# Shuffle the deck, and keep adding cards to hands until they are both
# not wanting to hit.
# Then declare the winner!
#
# Write specs one at a time
# Write the code getting the spec to pass
# Rinse and repeat
require 'spec_helper'

describe BlackJack::Game do
  let(:game) {BlackJack::Game.new}


  describe "on initialization" do
    it "has a deck of 52 cards" do
      expect(game.deck.size).to be == 52
    end
    it "has 2 players" do
      expect(game.players.empty?).to be true
    end

  end

  describe "#add_player" do
    it "has 1 player" do
      game.add_player
      expect(game.players.size).to be == 1
    end
    it "has 2 player" do
      game.add_player
      game.add_player
      expect(game.players.size).to be == 2
    end

  end

  describe "#deal_cards" do
    context "give specific card to player" do
      it "(game) deals 1 card to player" do
        game.add_player
        game.players[0].hand.add(BlackJack::Card.new(:heart, '10'))
        expect(game.players[0].hand.size).to be == 1
      end

      it "player should have 1 card in hand, rank 10" do
        game.add_player
        game.players[0].hand.add(BlackJack::Card.new(:heart, '10'))
        expect(game.players[0].hand.values).to be == [10]
      end
    end

    context "deal to player" do
      it "player should gain a card" do
        game.add_player
        card = game.deck.deal
        game.players[0].hand.add(card)
        expect(game.players[0].hand.size).to be == 1
      end
      it "the deck should have 51 cards" do
        game.add_player
        card = game.deck.deal
        game.players[0].hand.add(card)
        expect(game.deck.size).to be == 51
      end


    end



  end

  describe "#gameover" do
    it "player 0 busts" do
      game.add_player
      game.add_player

      game.players[0].hand.add(BlackJack::Card.new(:heart, '10'))
      game.players[0].hand.add(BlackJack::Card.new(:spade, '10'))
      game.players[0].hand.add(BlackJack::Card.new(:club, '10'))

      game.players[1].hand.add(BlackJack::Card.new(:club, '8'))

      expect(game.over?).to be true



    end




  end



end
