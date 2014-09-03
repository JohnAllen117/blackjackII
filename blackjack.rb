require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require 'pry'

SUITS = ['♠','♥','♦','♣']
VALUES = ['2','3','4','5','6','7','8','9','10','J','Q','K','A']

deck = Deck.new

p1 = Hand.new(deck)

dealer = Hand.new(deck)
player_choice = nil
puts"WELCOME TO BLACKJACK!"
puts"____________________________________________"
while player_choice != 's'
  puts"Your hand is:"
  puts"#{p1.show_hand}, Score:#{p1.score}"
  puts"Do you want to hit or stay?(H/S)"
  player_choice = gets.chomp.downcase
  if player_choice == 'h'
    p1.hit(deck)
  elsif player_choice != 's'
    puts "That is invalid input."
  end
  if p1.score > 21
    puts"Your hand was:"
    puts"#{p1.show_hand}, with a score of #{p1.score}"
    puts"YOU BUST!"
    exit
    break
  end
end

puts"The dealer's hand is:"
puts"#{dealer.show_hand}"
while dealer.score < 17
  puts"The dealer hits!"
  dealer.hit(deck)
  if dealer.score > 21
    puts"The dealer's hand was:"
    puts"#{dealer.show_hand}"
    puts"YOU WIN, DEALER BUSTS!"
    exit
  end
  puts"The dealer's hand is:"
  puts"#{dealer.show_hand}"
end
puts"The dealer stands."

if dealer.score >= p1.score
  puts"YOU LOSE!"
else
  puts"YOU WIN!"
end
