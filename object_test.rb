
class Alma

  def initialize(size, color)
    @size = size
    @color = color
  end

  def to_s
    result = "Alma:"
    result << " size " + @size.to_s
    result << " | color " + @color
    return "[" + result + " ]"
  end

end

a = Alma.new(10,"Green")

print "hello..." + a.to_s
