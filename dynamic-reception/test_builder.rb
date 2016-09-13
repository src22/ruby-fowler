require 'test/unit'
require_relative 'model'
require_relative 'builder'

class TestDynamicReception < Test::Unit::TestCase
  def test_builder
    # -----------------------------------------
    f1 = Flight.new "AA", "BOS", "2bb"
    f2 = Flight.new "NW", "1aa", "BBB"
    h = Hotel.new "Hyatt", 14
    i = Itinerary.new [f1, f2, h]
    # -----------------------------------------
    builder = PromotionBuilder.new
    builder.score(350).when_from("BOS")
    builder.score(100).when_brand("Hyatt")
    p = builder.content
    assert_equal 450, p.score_of( i )
  end
  def test_builder_partial_match
    # -----------------------------------------
    f1 = Flight.new "AA", "1aa", "2bb"
    f2 = Flight.new "NW", "BOS", "BBB"
    h = Hotel.new "Hilton", 14
    i = Itinerary.new [f1, f2, h]
    # -----------------------------------------
    builder = PromotionBuilder.new
    builder.score(350).when_from("BOS")
    builder.score(100).when_brand("Hyatt")
    p = builder.content
    assert_equal 350, p.score_of( i )
  end
  def test_builder_more_attrs
    # -----------------------------------------
    f1 = Flight.new "x x x", "BOS", "2bb"
    f2 = Flight.new "NW", "BOS", "BBB"
    h = Hotel.new "Hilton", 14
    i = Itinerary.new [f1, f2, h]
    # -----------------------------------------
    builder = PromotionBuilder.new
    builder.score(111).when_from_and_airline("BOS", "AA")
    builder.score(350).when_from_and_airline("BOS", "NW")
    builder.score(100).when_brand("Hyatt")
    p = builder.content
    assert_equal 350, p.score_of( i )
  end
  def test_builder_raise
    # -----------------------------------------
    assert_raise do
      builder = PromotionBuilder.new
      builder.score(111).when_from_and_airline("BOS", "AA")
      builder.score(350).when_from_and_airline("BOS", "NW", "wrong param")
      builder.score(100).when_brand("Hyatt")
    end
  end
end
