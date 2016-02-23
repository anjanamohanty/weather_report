require 'httparty'

class Hurricane
  def initialize
    @response = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/currenthurricane/view.json")
  end

  def list
    h_list = "Current Hurricanes:\n"
    @response["currenthurricane"].each do |h|
      h_list += "#{h["stormInfo"]["stormName_Nice"]}\n"
    end
    h_list
  end
end
