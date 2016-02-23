require 'minitest/autorun'
require 'minitest/pride'

require './conditions.rb'
require './forecast.rb'
require './astronomy.rb'
require './alerts.rb'
require './hurricane.rb'

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

class Alerts
  def initialize
    @response = JSON.parse(File.read("./alerts.json"))
  end
end

class Hurricane
  def initialize
    @response = JSON.parse(File.read("./hurricane.json"))
  end
end

class ReportTest < Minitest::Test

  def test_classes
    assert Conditions
    assert Forecast
    assert Astronomy
    assert Alerts
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
    assert_equal "Tuesday", f.ten_day_forecast[0].name
    assert_equal "Light rain early. Then remaining cloudy. High near 50F. Winds NNE at 5 to 10 mph. Chance of rain 100%.", f.ten_day_forecast[0].text
  end

  # Sunrise and sunset times.
  def test_can_get_sunrise_and_sunset_times
    a = Astronomy.new
    assert_equal "6:54 AM", a.sunrise
    assert_equal "6:04 PM", a.sunset
  end

  # Any current weather alerts.
  def test_can_get_current_weather_alerts
    a = Alerts.new
    assert_equal "Weather Alerts:\nFlood Warning: From 3:59 am CST on February 23, 2016 to 6:00 AM CST on February 26, 2016\n", a.get_alerts
  end

  # A list of all active hurricanes (anywhere)
  def test_can_get_active_hurricanes
    h = Hurricane.new
    h.list
    assert_equal "Current Hurricanes:\nInvest 90C\nTropical Cyclone Winston\n", h.list
  end

end
