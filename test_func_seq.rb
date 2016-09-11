require 'test/unit'
require_relative 'model'
require_relative 'func_seq_builder'


class BasicComputerBuilder < FunctionSequenceBuilder
  def doBuild
    computer
      processor
        cores 2
        i386
        processorSpeed 2.2
        disk
          size 150
        disk
          size 75
          diskSpeed 7200
          sata
  end
end

$expected_func_seq_computer = "[Computer:"+
"[Processor: core 2 | speed 2.2 | type i386 ] | "+
", [Disk: size 150 ],"+
" [Disk: size 75 | speed 7200 | sata ] ]"


class TestFowler2 < Test::Unit::TestCase

  def test_func_seq

    c = BasicComputerBuilder.new.buildTheComputer()

    assert_equal( $expected_func_seq_computer, c.to_s)

  end


end
