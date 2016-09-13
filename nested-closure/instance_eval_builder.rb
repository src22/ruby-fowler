require_relative 'model'

class InstanceEvalBuilder
  def initialize
    @comp = Computer.new
    @lastProc
    @diskArray = []
  end
  # static -----------------------------------------------
  def self.build &block
    builder = self.new
    builder.instance_eval &block
    return builder.computer
  end
  def self.buildFromFile aFileName
    builder = self.new
    builder.load_file aFileName
    return builder.computer
  end
  # non-static ---------------------------------------------
  def load_file aFileName
    load(File.readlines(aFileName).join("\n"))
  end
  def load aStream
    instance_eval aStream
  end
  def computer
    return @comp
  end
  def processor &block
    @comp.processor = ProcessorBuilder.new.build(block)
  end
  def disk &block
    @comp.disks << DiskBuilder.new.build(block)
  end
end
#------------------------------------------------------
class ProcessorBuilder
  def build block
    @processor = Processor.new
    instance_eval(&block)
    return @processor
  end
  def cores arg
    @processor.core = arg
  end
  def i386
    @processor.type = :i386
  end
  def processorSpeed arg
    @processor.speed = arg
  end

end
#------------------------------------------------------
class DiskBuilder
  def build block
    @disk = Disk.new
    instance_eval(&block)
    return @disk
  end
  def size arg
    @disk.size = arg
  end
  def diskSpeed arg
    @disk.speed = arg
  end
  def sata
    @disk.interface = :sata
  end
end

# -- end --
