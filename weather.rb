require 'yahoo_weatherman'

def get_location(location)
	client = Weatherman::Client.new
	response = client.lookup_by_location(location)
end

puts "What is your WOEID?"
woeid = gets.chomp
home = get_location(woeid)

today = Time.now.strftime('%w').to_i

home.forecasts.each do |forecast|

day = forecast['date']
day_of_week = day.strftime('%w').to_i

if day_of_week == today 
	day_name = 'Today'
elsif day_of_week == today + 1 
	day_name = 'Tomorrow'
else
	day_name = day.strftime('%A')
end

	puts day_name + ' will have ' + forecast['text'].downcase + ' with a high of ' + forecast['high'].to_s + ' degrees and a low of ' + forecast['low'].to_s
end

