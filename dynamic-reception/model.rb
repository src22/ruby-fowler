

class Itinerary
  def initialize
    @items = []
  end
  def << arg
    @items << arg
  end
  def items
    return @items.dup
  end
end

class Flight
  attr_reader :airline, :from, :to
  def initialize airline, from, to
    @airline, @from, @to = airline, from, to
  end
  def to_s
    return  "[Flight: " + @airline + " " + @from + " " + @to + "]"
  end
end

class Hotel
  attr_accessor :brand, :nights
  def initialize brand, nights
    @brand, @nights = brand, nights
  end
end

# ----------------------------
