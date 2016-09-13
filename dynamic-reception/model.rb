

class Itinerary
  def initialize items = []
    @items = items
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
  def to_s
    return  "[Hotel: " + @brand + " " + @nights.to_s + "]"
  end
end




# ---------------------------------------------------------------------



class Promotion
  def initialize rules
    @rules = rules
  end
  def score_of anItinerary
    return @rules.inject(0) {|sum,r| sum += r.score_of(anItinerary)}
  end
  def trace
    puts "@rules.length = " + @rules.length.to_s
    puts "@rules.info = " + @rules[0].info
  end
end

class PromotionRule
  def initialize anInteger
    @score = anInteger
    @conditions = []
  end
  def add_condition aPromotionCondition
    @conditions << aPromotionCondition
  end
  def score_of anItinerary
    return (@conditions.all?{|c| c.match(anItinerary)}) ? @score : 0
  end
  def info
    return "score = " + @score.to_s + "  @conditions.length = " + @conditions.length.to_s
  end
end

class EqualityCondition
  def initialize aSymbol, value
    @attribute, @value = aSymbol, value
  end
  def match anItinerary
    return anItinerary.items.any?{|i| match_item i}
  end
  def match_item anItem
    return false unless anItem.respond_to?(@attribute)
    return @value == anItem.send(@attribute)
  end
end

class AtLeastCondition
  def initialize aSymbol, value
    @attribute, @value = aSymbol, value
  end
  def match anItinerary
    return anItinerary.items.any?{|i| match_item i}
  end
  def match_item anItem
    return false unless anItem.respond_to?(@attribute)
    return @value <= anItem.send(@attribute)
  end
end

class BlockCondition
  def initialize &aBlock
    @aBlock = aBlock
  end
  def match anItinerary
    puts "calling match..."
    value = @aBlock.call ( anItinerary )
    puts "The value of the match: " + value.to_s
    return value
  end
end
