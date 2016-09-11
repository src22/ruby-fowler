require 'test/unit'
require_relative 'model'

class TestFowler1 < Test::Unit::TestCase

  def test_simple_create
    
    d1 = Disk.new(50,7200)
    d2 = Disk.new(60,7210)
    p = Processor.new(64,10000)
    c = Computer.new(p, [d1,d2] )

    assert_equal( $expected_text, c.to_s)

  end

end
