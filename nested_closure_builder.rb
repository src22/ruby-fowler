require_relative 'model'

class NestedClosureBuilder

  def initialize
    @comp = Computer.new
    @lastProc
    @diskArray = []
  end
  def doBuild
    puts "This should be overridden!"
  end
  def buildTheComputer
    doBuild
    return @comp
  end
  #------------------------------------------------------
  def computer &block
    @comp = Computer.new
    block.call
  end
  def processor &block
    @comp.processor = Processor.new
    block.call
  end
  def cores arg
    @comp.processor.core = arg
  end
  def i386
    @comp.processor.type = :i386
  end
  def processorSpeed arg
    @comp.processor.speed = arg
  end
  def disk
    @comp.disks << Disk.new
    yield
  end
  def size arg
    @comp.disks.last.size = arg
  end
  def diskSpeed arg
    @comp.disks.last.speed = arg
  end
  def sata
    @comp.disks.last.interface = :sata
  end





end
