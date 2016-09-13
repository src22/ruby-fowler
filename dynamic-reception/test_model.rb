require 'test/unit'
require_relative 'model'

class TestDynamicReception < Test::Unit::TestCase
  def test_flight
    f = Flight.new "AA", "1aa", "2bb"
    assert_equal "[Flight: AA 1aa 2bb]", f.to_s
  end
  def test_hotel
    h = Hotel.new "Hyatt", 14
    assert_equal "[Hotel: Hyatt 14]", h.to_s
  end
  def test_condition
    e = EqualityCondition.new :airline, "NW"
    f1 = Flight.new "AA", "1aa", "2bb"
    f2 = Flight.new "NW", "1aa", "BBB"
    h = Hotel.new "Hyatt", 14
    i = Itinerary.new [f1, f2, h]
    assert_true e.match(i)
  end
  def test_flexible_rule_false
    c = BlockCondition.new { false }
    assert_false c.match("something")
  end
  def test_flexible_rule_true
    c = BlockCondition.new { true }
    assert_true c.match("something")
  end
  # VERY STRANGE BEHAVIOUR FROM RUBY
  # and dont not ever writes the result value
  # just returns back but gives back TRUE
  def test_flexible_rule_false_STRANGE
    c = BlockCondition.new { return false }
    assert_true c.match("something")
  end
  def test_flexible_not_found
    c = BlockCondition.new {
     |itinerary|
       flights = itinerary.items.select {|i| i.kind_of? Flight}
       found1 = flights.any?{|f| f.to == "BBB"}
       found2 = flights.all?{|f| %[AA NW].include?f.airline}
        found1 && found2
    }
    # ---------------------------------------------
    f1 = Flight.new "x x x", "1aa", "2bb"
    f2 = Flight.new "NW", "1aa", "BBB"
    h = Hotel.new "Hyatt", 14
    i = Itinerary.new [f1, f2, h]
    # ---------------------------------------------
    assert_false c.match(i)
  end
  def test_flexible_found
    c = BlockCondition.new {
     |itinerary|
       flights = itinerary.items.select {|i| i.kind_of? Flight}
       found1 = flights.any?{|f| f.to == "BBB"}
       found2 = flights.all?{|f| %[AA NW].include?f.airline}
       true && found1 && found2
    }
    # ---------------------------------------------
    f1 = Flight.new "AA", "1aa", "2bb"
    f2 = Flight.new "NW", "1aa", "BBB"
    h = Hotel.new "Hyatt", 14
    i = Itinerary.new [f1, f2, h]
    # ---------------------------------------------
    assert_true c.match(i)
  end
  def test_flexible_empty
    c = BlockCondition.new {
     |itinerary|
       flights = itinerary.items.select {|i| i.kind_of? Flight}
       found1 = flights.any?{|f| f.to == "BBB"}
       found2 = flights.all?{|f| %[AA NW].include?f.airline}
       true && found1 && found2
    }
    # ---------------------------------------------
    h = Hotel.new "Hyatt", 14
    i = Itinerary.new [h]
    # ---------------------------------------------
    assert_false c.match(i)
  end

end
