require_relative 'model'

class FunctionSequenceBuilder

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
  def computer
    @comp = Computer.new
  end
  def processor
    @comp.processor = Processor.new
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
