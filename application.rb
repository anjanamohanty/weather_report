require './conditions.rb'
require './forecast.rb'
require './astronomy.rb'
require './alerts.rb'
require './hurricane.rb'

puts "Please enter the zip for which you would like weather info"
zip = gets.chomp

# Current conditions at that location.

c = Conditions.new(zip)

puts "Your weather report for #{c.location}:"
puts c.temperature
puts c.weather

# 10 day forecast for that location.

f = Forecast.new(zip)

puts "Your 10 day forecast:"
puts f.ten_day_forecast

# Sunrise and sunset times.

a = Astronomy.new(zip)

puts
puts a.sunrise
puts a.sunset

# Any current weather alerts.

alerts = Alerts.new(zip)

puts
puts alerts.get_alerts

# A list of all active hurricanes (anywhere).

h = Hurricane.new(zip)

puts
puts h.list
