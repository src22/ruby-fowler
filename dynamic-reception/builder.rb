require_relative 'model'

class PromotionBuilder
  def initialize
    @rules = []
  end
  def content
    return Promotion.new(@rules)
  end
  def score anInteger
    @rules << PromotionRule.new(anInteger)
    return PromotionConditionBuilder.new(self)
  end
  def add_condition arg
    @rules.last.add_condition arg
  end
end




class PromotionConditionBuilder
  def initialize parent
    @parent = parent
  end
  def method_missing(method_id, *args)
    method_id_str = method_id.to_s
    puts "method_id_str: " + method_id_str
    match = /^when_(\w*)/.match(method_id_str)
    if (match)
      puts "MATCH"
      process_when match.captures.last, *args
    else
      super
    end
  end
  def process_when method_tail, *args
    attribute_names = method_tail.split('_and_')
    check_number_of_attributes(attribute_names, args)
    populate_rules(attribute_names, args)
  end
  def check_number_of_attributes(names, args)
    unless names.size == args.size
      throw "There are %d attribute names but %d arguments..." %[names.size, values.size]
    end
  end
  def populate_rules(names, args)
    names.zip(args).each { |name, value|
      @parent.add_condition(EqualityCondition.new(name, value))
    }
  end
end
