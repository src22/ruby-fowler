
class Disk

  def initialize(size = 0, speed = 0, interface = nil)
    @size = size
    @speed = speed
    @interface = interface
  end

  def to_s
    result = "Disk:"

    if (@size); result << " size " + @size.to_s; end
    if (@speed && @speed>0); result << " | speed " + @speed.to_s; end
    if (@interface); result << " | " + @interface.to_s; end

    return "[" + result + " ]"
  end

  # getters and setters in ---------------
  def size=(size); @size = size; end
  def size; @size; end

  def speed=(speed); @speed = speed; end
  def speed; @speed; end

  def interface=(interface); @interface = interface; end
  def interface; @interface; end
  # getters and setters out ---------------


end

d1 = Disk.new(50,7200)
d2 = Disk.new(60,7210)
puts "hello... " + d1.to_s

# ---------------------------------------------------------------------

class Processor

  def initialize(core = 0, speed = 0)
    @core = core
    @speed = speed
    @type = nil
  end

  def to_s
    result = "Processor:"
    if (@core); result << " core " + @core.to_s; end
    if (@speed); result << " | speed " + @speed.to_s; end
    if (@type); result << " | type " + @type.to_s; end

    return "[" + result + " ]"
  end

  # getters and setters in ---------------
  def core=(core); @core = core; end
  def core; @core; end

  def speed=(speed); @speed = speed; end
  def speed; @speed; end

  def type=(type); @type = type; end
  def type; @type; end
  # getters and setters out ---------------

end

p = Processor.new(64,10000)
puts "hello... " + p.to_s

p.core = 12

p2 = Processor.new
puts "hello... " + p2.to_s

# ---------------------------------------------------------------------


class Computer



  def initialize(processor = nil, disks = [])
    @processor = processor
    @disks = disks
  end

  def to_s
    result = "Computer:"
    result << "" + @processor.to_s
    result << " | "

    @disks.each do |i|
      result << ", " + i.to_s
    end

    return "[" + result + " ]"
  end

  # getters and setters in ---------------
  def processor=(processor); @processor = processor; end
  def processor; @processor; end

  def disks=(disks); @disks = disks; end
  def disks; @disks; end
  # getters and setters out ---------------


end

c = Computer.new(p, [d1,d2] )
puts "hello... " + c.to_s

c1 = Computer.new()

$expected_text = "[Computer:"+
"[Processor: core 64 | speed 10000 ] | "+
", [Disk: size 50 | speed 7200 ],"+
" [Disk: size 60 | speed 7210 ] ]"


# --- end ---
