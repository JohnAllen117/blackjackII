class Hand
  attr_accessor :score, :hand
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
      if card.rank == 'A'
        number_of_aces += 1
      end
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
