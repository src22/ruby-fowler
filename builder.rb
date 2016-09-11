require_relative 'model'

class Builder

  def initialize
    @diskArray = []
  end

  def disk(size, speed)
    d = Disk.new(size,speed)
    @lastDisc = d
    @diskArray << d
    return d
  end

  def getLastDisk()
    return @lastDisc
  end

  def getDiskArraySize()
    return @diskArray.size
  end

  def processor(core, speed)
    p = Processor.new(core,speed)
    @lastProc = p
    return p
  end

  def getLastProc()
    return @lastProc
  end

  def createComputer()
    return Computer.new(@lastProc, @diskArray)
  end



end
