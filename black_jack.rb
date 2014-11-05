require_relative "./lib/card"
require_relative "./lib/deck"
require_relative "./lib/hand"
require_relative "./lib/game"
require_relative "./lib/player"

def print_players player0, player1
  puts "-"*15
  print "Player 0's Hand "
  player0.hand.cards.each do |card|
    print "#{card.face}#{card.suit} "
  end
  puts "Value: #{player0.hand.values}."

  print "Player 1's Hand "
  player1.hand.cards.each do |card|
    print "#{card.face}#{card.suit} "
  end
  puts "Value: #{player1.hand.values}."

end

def winner player0, player1, bet_amount

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
    player0.get_chips bet_amount*2
  elsif highest_p0 < highest_p1
    winner = "Player1 Wins with #{highest_p1}."
    player1.get_chips bet_amount*2
  else
    winner = "Push with #{highest_p0}."
    player0.get_chips bet_amount; player1.get_chips bet_amount
  end

  winner

end

def reset_hands players, deck

  players.each do |player|
    player.redeal
    player.hand.add(deck.deal)
    player.hand.add(deck.deal)
  end
  return players, deck
end

def place_bets player, bet_amount
  player.bet bet_amount
end

def reset_deck deck, game
  if deck.size < 15
    deck = game.new_deck

    puts
    puts
    puts "Shuffled Deck"
    puts
  end
  deck
end




game = BlackJack::Game.new
deck = game.deck
bet_amount = game.bet_amount

game.add_player 13 #will hit if below
game.add_player 20 #will hit if below
players = game.players


system "clear"
hand_count = 0
running = true
while running
  puts "...:New Hand:..."
  hand_count += 1
  deck = reset_deck(deck, game)
  (player0, player1), deck = reset_hands(players, deck)

  players.each {|player| place_bets player, bet_amount}

  stay = [false,false]

  while (!game.over? && stay == [false,false])

    print_players player0, player1

    game.players.each_with_index do |player, i|
      hand = player.hand

      if hand.hit? player.risk
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
  puts winner player0, player1, bet_amount
  puts "Player0 Chips:#{player0.chip_count} | Player1 Chips:#{player1.chip_count}"
  puts
  puts "#{hand_count} Hands Played, New Game [y,n]"
  response = gets.chomp
  running = false if response == "n"

end
