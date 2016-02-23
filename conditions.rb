require 'httparty'

class Conditions

  def initialize(zip)
    @response = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{zip}.json")
  end

  def temperature
    @response["current_observation"]["temperature_string"]
  end

  def location
    @response["current_observation"]["display_location"]["full"]
  end

  def weather
    @response["current_observation"]["weather"]
  end
  
end
