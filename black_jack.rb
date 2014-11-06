require_relative "./lib/card"
require_relative "./lib/deck"
require_relative "./lib/hand"
require_relative "./lib/game"
require_relative "./lib/player"

game = BlackJack::Game.new
bet_amount = game.bet_amount

system "clear" #clr terminal
hand_count = 1 #track number of hands played

puts "How many players?(recommend 2,3,10)"
game.get_players(gets.chomp.to_i)

elimination = true
while elimination
  players = game.players
  puts "\n...:New Hand:\##{hand_count}|Decks:#{game.deck.count}:..."
  hand_count += 1
  deck = game.reset_deck

  players.each {|player| player.reset_hands(deck)} #reset hand
  players.each {|player| player.place_bets(bet_amount)} #place bets

  stay = [false,false]

  while (!game.over? && stay == [false,false])

    game.hand_status

    game.players.each_with_index do |player, i|
      hand = player.hand

      if hand.hit?(player.risk)
        card = deck.deal
        player.hand.add(card)
        puts "\n#{player.name} hits"
        game.hand_status
      else
        stay[i] = true
      end
    end
  end

  game.declare_winners
  game.leader_board

  elimination = (game.players.length != 1)
end

player = game.players.first
puts "#{player.name}'s Risk:#{player.risk} | Hands Played:#{hand_count}"
