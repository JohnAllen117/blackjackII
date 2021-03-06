# Creates a new card with a rank and a suit
class Card
  attr_reader :rank, :suit
  def initialize(rank, suit)
    @suit = suit
    @rank = rank
  end

  def determine_score
    if %w(J Q K A).include?(@rank)
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
