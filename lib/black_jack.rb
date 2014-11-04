require_relative "card"
require_relative "deck"
require_relative "hand"
require_relative "game"
require_relative "player"

def print_players player0, player1
  puts "-"*15
  puts "Player 0's Hand Value: #{player0.hand.values}."
  player0.hand.cards.each do |card|
    print "#{card.face}#{card.suit} "
  end
  puts

  puts "Player 1's Hand Value: #{player1.hand.values}."
  player1.hand.cards.each do |card|
    print "#{card.face}#{card.suit} "
  end
  puts

end

def winner player0, player1

  #need to find the highest, no busted score for player0
  highest_p0 = 0
  player0.hand.values.each do |total_value|
    highest_p0 = total_value unless total_value > 21
  end

  #need to find the highest, no busted score for player1
  highest_p1 = 0
  player1.hand.values.each do |total_value|
    highest_p1 = total_value unless total_value > 21
  end


  #if player0 score is higher than player1 (players[i].hand.values)=>array of values
  if highest_p0 > highest_p1
    winner = "Player0 Wins with #{highest_p0}."
  elsif highest_p0 < highest_p1
    winner = "Player1 Wins with #{highest_p1}."
  else
    winner = "Push with #{highest_p0}."
  end

  winner

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

system "clear"
puts "...:New Game:..."
while (!game.over? && stay == [false,false])

  print_players player0, player1

  game.players.each_with_index do |player, i|
    hand = player.hand

    if hand.hit?
      card = deck.deal
      player.hand.add(card)
      puts
      puts "Player#{i} hits"
      print_players player0, player1
    else
      stay[i] = true
    end

  end

end

puts
puts winner player0, player1
