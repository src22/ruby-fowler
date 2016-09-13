require 'test/unit'
require_relative 'model'
require_relative 'nested_closure_builder'


class ConcreteNestedClosureBuilder < NestedClosureBuilder
  def doBuild
    computer do
      processor do
        cores 3
        i386
        processorSpeed 3.2
      end
      disk do
        size 130
      end
      disk do
        size 73
        diskSpeed 7200
        sata
      end
    end
  end
end

$expected_nested_computer = "[Computer:"+
"[Processor: core 3 | speed 3.2 | type i386 ] | "+
", [Disk: size 130 ],"+
" [Disk: size 73 | speed 7200 | sata ] ]"


class TestFowler3 < Test::Unit::TestCase

  def test_nested_closure

    c = ConcreteNestedClosureBuilder.new.buildTheComputer()

    assert_equal( $expected_nested_computer, c.to_s)

  end


end
