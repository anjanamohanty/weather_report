require 'httparty'

class Astronomy

  def inititialize(zip)
    @response = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/astronomy/q/#{zip}.json")
  end

  def sunrise
    hour = @response["sun_phase"]["sunrise"]["hour"].to_i
    minute = @response["sun_phase"]["sunrise"]["minute"]
    "Sunrise: #{hour}:#{minute} AM"
  end

  def sunset
    hour = @response["sun_phase"]["sunset"]["hour"].to_i
    minute = @response["sun_phase"]["sunset"]["minute"]
    "Sunset: #{hour-12}:#{minute} PM"
  end

end
