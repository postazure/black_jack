require_relative "card"
require_relative "deck"
require_relative "hand"
require_relative "game"
require_relative "player"

def print_players player0, player1
  puts "-"*15
  puts "Player 0's Hand Value: #{player0.hand.values}."
  player0.hand.cards.each do |card|
    puts "#{card.face} of #{card.suit}s."
  end
  puts

  puts "Player 1's Hand Value: #{player1.hand.values}."
  player1.hand.cards.each do |card|
    puts "#{card.face} of #{card.suit}s."
  end
  puts

end

def winner player0, player1

  #need to find the highest, no busted score for player0
  #need to find the highest, no busted score for player1

  #if player0 score is higher than player1 (players[i].hand.values)=>array of values
  # player0 wins
  #elsif player1 score is higher than player0
  # player1 wins
  #else
  # PUSH
  #end

end



game = BlackJack::Game.new

deck = game.deck

game.add_player
game.add_player

player0 = game.players[0]
player1 = game.players[1]

#--- Starting Hand
player0.hand.add(game.deck.deal)
player0.hand.add(game.deck.deal)
player1.hand.add(game.deck.deal)
player1.hand.add(game.deck.deal)
#---

stay = [false,false]


puts "...:New Game:..."
while (!game.over? && stay == [false,false])

  print_players player0, player1

  game.players.each_with_index do |player, i|
    hand = player.hand

    if hand.hit?
      card = deck.deal
      player.hand.add(card)
      puts "+++Player#{i} hits"
      print_players player0, player1
    else
      stay[i] = true
    end

  end

end

puts winner player0, player1
