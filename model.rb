
class Disk

  def initialize(size, speed)
    @size = size
    @speed = speed
  end

  def to_s
    result = "Disk:"
    result << " size " + @size.to_s
    result << " | speed " + @speed.to_s
    return "[" + result + " ]"
  end

end

d1 = Disk.new(50,7200)
d2 = Disk.new(60,7210)
puts "hello... " + d1.to_s

# ---------------------------------------------------------------------

class Processor

  def initialize(core, speed)
    @core = core
    @speed = speed
  end

  def to_s
    result = "Processor:"
    result << " core " + @core.to_s
    result << " | speed " + @speed.to_s
    return "[" + result + " ]"
  end

end

p = Processor.new(64,10000)
puts "hello... " + p.to_s

# ---------------------------------------------------------------------


class Computer

  def initialize(processor, disks)
    @processor = processor
    @disks = disks
  end

  def to_s
    result = "Computer:"
    result << " " + @processor.to_s
    result << " | "

    @disks.each do |i|
      result << ", " + i.to_s
    end

    return "[" + result + " ]"
  end

end

c = Computer.new(p, [d1,d2] )
puts "hello... " + c.to_s

expected_text = "[Computer: "
+"[Processor: core 64 | speed 10000 ] | "
+", [Disk: size 50 | speed 7200 ],"
+" [Disk: size 60 | speed 7210 ] ]"


# --- end ---
