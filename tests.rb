require 'minitest/autorun'
require 'minitest/pride'

require './conditions.rb'
require './forecast.rb'
require './astronomy.rb'

class Conditions
  def initialize
    @response = JSON.parse(File.read("./conditions.json"))
  end
end

class Forecast
  def initialize
    @response = JSON.parse(File.read("./forecast.json"))
  end
end

class Astronomy
  def initialize
    @response = JSON.parse(File.read("./astronomy.json"))
  end
end

class ReportTest < Minitest::Test

  def test_classes
    assert Conditions
    assert Forecast
    assert Astronomy
  end

  # Current conditions at that location.
  def test_can_get_current_conditions
    c = Conditions.new
    assert_equal "52 F (11.1 C)", c.temperature
    assert_equal "Durham, NC", c.location
    assert_equal "Mostly Cloudy", c.weather
  end

  # 10 day forecast for that location.
  def test_can_get_10_day_forecast
    f = Forecast.new
    assert_equal "Light rain early. Then remaining cloudy. High near 50F. Winds NNE at 5 to 10 mph. Chance of rain 100%.", f.forecast_day(1)
    assert_equal "Clear skies. Low 32F. Winds light and variable.", f.forecast_day(10)

    assert_equal "Day 1: Light rain early. Then remaining cloudy. High near 50F. Winds NNE at 5 to 10 mph. Chance of rain 100%.\nDay 2: Showers early becoming a steady light rain late. Low 46F. Winds light and variable. Chance of rain 70%.\nDay 3: Windy with strong thunderstorms likely. Damaging winds, large hail and possibly a tornado with some storms. High 68F. Winds SSE at 25 to 35 mph. Chance of rain 90%.\nDay 4: Showers in the evening, then partly cloudy overnight. Thunder is possible early. Low near 45F. Winds SW at 15 to 25 mph. Chance of rain 80%.\nDay 5: Partly cloudy and windy. High 54F. Winds WSW at 20 to 30 mph.\nDay 6: Mostly clear skies. Low 33F. Winds W at 10 to 15 mph.\nDay 7: Sunny. High 51F. Winds NW at 10 to 20 mph.\nDay 8: Clear. Low 28F. Winds light and variable.\nDay 9: Sunny. High 51F. Winds WSW at 5 to 10 mph.\nDay 10: Clear skies. Low 32F. Winds light and variable.\n", f.ten_day_forecast
  end

  # Sunrise and sunset times.
  def test_can_get_sunrise_and_sunset_times
    a = Astronomy.new
    assert_equal "Sunrise: 6:54 AM", a.sunrise
    assert_equal "Sunset: 6:04 PM", a.sunset
  end

  # Any current weather alerts.

  # A list of all active hurricanes (anywhere)

end
