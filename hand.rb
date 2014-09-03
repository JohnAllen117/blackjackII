# Creates new object hand, handles all arithmatic
# in regards to score of the hand,
# and keeps track of cards per player
class Hand
  attr_reader :score, :hand
  def initialize(deck)
    @hand = []
    @hand << deck.draw
    @hand << deck.draw
    @aces = ace_count(@hand)
    @score = calculate(@hand)
  end

  def calculate(hand)
    score = 0
    hand.each do |card|
      score += card.determine_score
      @aces = ace_count(hand)
    end
    while @aces > 0 && score > 21
      score -= 10
      @aces -= 1
    end
    score
  end

  def hit(deck)
    @hand << deck.draw
    @score = calculate(@hand)
  end

  def ace_count(hand)
    number_of_aces = 0
    hand.each do |card|
      number_of_aces += 1 if card.rank == 'A'
    end
    number_of_aces
  end

  def show_hand
    display = []
    @hand.each do |card|
      display << "#{card.rank}#{card.suit}"
    end
    display
  end
end
