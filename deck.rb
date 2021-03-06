# Creates a new deck of 52 cards
class Deck
  def initialize
    @collection = []
    SUITS.each do|suit|
      VALUES.each do |value|
        @collection << Card.new(value, suit)
      end
    end
    @collection.shuffle!
  end

  def draw
    @collection.pop
  end

  def length
    @collection.length
  end
end
