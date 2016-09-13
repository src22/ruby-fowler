
# in the book: PromotionBuilder
class TheBigBuilder
  def initialize
    @rules = []
  end
  def content
    return Promotion.new(@rules)
  end
  def score anInteger
    @rules << PromotionRule.new(anInteger)
    return self
  end
  def when
    return ConditionAttributeNameBuilder.new(self)
  end
  def and
    return ConditionAttributeNameBuilder.new(self)
  end
  def add_condition cond
    @rules.last.add_condition cond
  end
end

class Builder
  attr_accessor :content, :parent
  def initialize parentBuilder = nil
    @parent = parentBuilder
  end
end

# in the book: PrmotionConditionBuilder
class TheLittleBuilder < Builder
  attr_accessor :nameChild, :operatorChild, :valueChild

  def finish_the_condition
    content = @operatorChild.build_content(@nameChild.content, @valueChild.content)
    @parent.add_condition content
    return @parent
  end
end

# .... [[from]] equals BOS
class ConditionAttributeNameBuilder < Builder
  def initialize parent
    @parent = TheLittleBuilder.new(parent)
    @parent.nameChild = self
  end
  def method_missing method_id, *args
    @content = method_id.to_s
    return ConditionOperationBuilder.new(@parent)
  end
end

# .... from {{equals}} BOS
class ConditionOperationBuilder < Builder
  def initialize parent
    super
    @parent.operatorChild = self
  end
  def equals
    @contentClass = EqualityCondition  # this is a class
    return next_builder
  end
  def at
    return self
  end
  def least
    @contentClass = AtLeastCondition  # this is a class
    return next_builder
  end
  def next_builder
    return ConditionValueBuilder.new(@parent)
  end
  def build_content name, value
    return @contentClass.new(name, value)
  end

end


# .... from equals <<BOS>>
class ConditionValueBuilder < Builder
  def initialize parent
    super
    @parent.valueChild = self
  end
  def method_missing method_id, *args
    @content = method_id.to_s
    @content = @content.slice(1..-1).to_i  if  @content =~ /^_\d+$/   # if it is number, like _12
    throw "Something is wrong...-use ZERO instead..." if (@content == 0)
    @content = 0 if (@content == "ZERO")

    @parent.finish_the_condition
  end
end
