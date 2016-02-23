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
puts "Temperature: #{c.temperature}"
puts c.weather

# 10 day forecast for that location.

f = Forecast.new(zip)

puts
puts "Your 10 day forecast:"
f.ten_day_forecast.each do |p|
  puts "#{p.name}: #{p.text}"
end

# Sunrise and sunset times.

a = Astronomy.new(zip)

puts
puts "Sunrise: #{a.sunrise}"
puts "Sunset: #{a.sunset}"

# Any current weather alerts.

alerts = Alerts.new(zip)

puts
puts alerts.get_alerts

# A list of all active hurricanes (anywhere).

h = Hurricane.new

puts
puts h.list
