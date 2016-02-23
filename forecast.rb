require 'httparty'
require './period.rb'

class Forecast

  def initialize(zip)
    @response = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/forecast10day/q/#{zip}.json")
  end

  def ten_day_forecast
    array = @response["forecast"]["txt_forecast"]["forecastday"]
    forecast = []
    array.each do |e|
      forecast << Period.new(e["title"], e["fcttext"])
    end
    forecast
  end

end
