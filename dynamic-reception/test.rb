require 'test/unit'
require_relative 'model'

class TestDynamicReception < Test::Unit::TestCase
  def test_model
    f = Flight.new "Aaa", "1aa", "2bb"
    assert_equal "[Flight: Aaa 1aa 2bb]", f.to_s
  end
end
