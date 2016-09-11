require 'test/unit'
require_relative 'model'
require_relative 'simple_builder'

class TestFowler1 < Test::Unit::TestCase

  def test_simple_create

    d1 = Disk.new(50,7200)
    d2 = Disk.new(60,7210)
    p = Processor.new(64,10000)
    c = Computer.new(p, [d1,d2] )

    assert_equal( $expected_text, c.to_s)

  end

  def test_build_disk

    b = Builder.new
    d = b.disk(51,7201)

    assert_equal( "[Disk: size 51 | speed 7201 ]", d.to_s)
    assert_equal( "[Disk: size 51 | speed 7201 ]", b.getLastDisk().to_s )

  end

  def test_build_more_disk

    b = Builder.new
    d1 = b.disk(51,7201)
    d2 = b.disk(52,7202)
    d3 = b.disk(53,7203)

    assert_equal( 3, b.getDiskArraySize() )
    assert_equal( "[Disk: size 53 | speed 7203 ]", b.getLastDisk().to_s )

  end

  def test_build_processor

    b = Builder.new
    p = b.processor(128,20000)

    assert_equal( "[Processor: core 128 | speed 20000 ]", p.to_s)
    assert_equal( "[Processor: core 128 | speed 20000 ]", b.getLastProc().to_s)

  end


  def test_build_computer

    b = Builder.new
    d1 = b.disk(50,7200)
    d2 = b.disk(60,7210)
    p = b.processor(64,10000)
    c = b.createComputer()

    assert_equal( $expected_text, c.to_s)

  end



end
