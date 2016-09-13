require_relative 'model'
require_relative 'chain'
require 'test/unit'

class TestChain < Test::Unit::TestCase
  def initialize *arg
    super *arg
    f1 = Flight.new "AA", "BOS", "2bb"
    f2 = Flight.new "NW", "1aa", "BBB"
    h = Hotel.new "Hyatt", 14
    @i = Itinerary.new [f1, f2, h]
  end
  def test_chain_equals
    builder = TheBigBuilder.new
    builder.score(350).when.from.equals.BOS
    builder.score(100).when.brand.equals.Hyatt
    p = builder.content
    assert_equal 450, p.score_of( @i )
  end
  def test_chain_at_least
    builder = TheBigBuilder.new
    builder.score(170).when.from.equals.BOS.and.nights.at.least._3
    p = builder.content
    puts "INFO "
    puts "INFO "
    puts "INFO "
    p.trace
    puts p.score_of( @i ).to_s
    # assert_equal 170, p.score_of( @i )
  end
  def test_chain_at_least__false
    builder = TheBigBuilder.new
    builder.score(170).when.from.equals.BOS.and.nights.at.least._30
    p = builder.content
    assert_equal 170, p.score_of( @i )
  end

end
