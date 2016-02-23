require 'httparty'

class Forecast

  def inititialize(zip)
    @response = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/forecast10day/q/#{zip}.json")
  end

  def forecast_day(day)
    @response["forecast"]["txt_forecast"]["forecastday"][day-1]["fcttext"]
  end

  def ten_day_forecast
    array = @response["forecast"]["txt_forecast"]["forecastday"]
    forecast = ""
    10.times do |e|
      forecast += "Day #{e+1}: #{array[e]["fcttext"]}\n"
    end
    forecast
  end

end
