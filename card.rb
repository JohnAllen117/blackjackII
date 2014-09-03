class Card
  attr_accessor :rank, :suit
  def initialize(rank,suit)
    @suit = suit
    @rank = rank
  end

  def determine_score
    if ['J', 'Q', 'K', 'A'].include?(@rank)
      if ['A'].include?(@rank)
        11
      else
        10
      end
    else
      @rank.to_i
    end
  end
end
