require 'httparty'

class Alerts
  def initialize(zip)
    @response = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/alerts/q/#{zip}.json")
  end

  def get_alerts
    return "No current weather alerts" if (@response["alerts"].length == 0)
    alerts = "Weather Alerts:\n"
    @response["alerts"].each do |a|
      alerts += "#{a["description"]}: From #{a["date"]} to #{a["expires"]}\n"
    end
    alerts
  end
end
