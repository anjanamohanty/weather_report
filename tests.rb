require 'minitest/autorun'
require 'minitest/pride'

require './conditions.rb'

class Conditions
  def initialize
    @response = JSON.parse(File.read("./conditions.json"))
  end
end

class ReportTest < Minitest::Test

  def test_classes
    assert Conditions
  end

  # Current conditions at that location.
  def test_can_get_current_conditions
    c = Conditions.new
    assert_equal "52 F (11.1 C)", c.temperature
    assert_equal "Durham, NC", c.location
    assert_equal "Mostly Cloudy", c.weather
  end

  # 10 day forecast for that location.

  # Sunrise and sunset times.

  # Any current weather alerts.

  # A list of all active hurricanes (anywhere)

end
