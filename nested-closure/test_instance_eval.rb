require 'test/unit'
require_relative 'model'
require_relative 'instance_eval_builder'

$expected_inst_computer = "[Computer:"+
"[Processor: core 8 | speed 4.2 | type i386 ] | "+
", [Disk: size 140 ],"+
" [Disk: size 73 | speed 7200 | sata ] ]"


class TestFowler4 < Test::Unit::TestCase

  def test_instance_eval

    c = InstanceEvalBuilder.buildFromFile("001-data.dsl")
    assert_equal( $expected_inst_computer, c.to_s)

  end

end
