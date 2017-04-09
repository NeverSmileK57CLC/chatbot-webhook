require "http"
require "uri"

class WebhookController < ApplicationController
	def index
		city = request["result"]["parameters"]["address"]["city"]
		country = request["result"]["parameters"]["address"]["country"]
		place = "#{city}, #{country}"
		call_api = HTTP.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22#{URI.encode(place)}%22)&format=json")
		# byebug
		response = JSON.parse(call_api.to_s)

		unless response["query"] && response["query"]["results"]
			return {}
		end
		channel = response["query"]["results"]["channel"]
		return {} unless channel
		item = channel["item"]
		location = channel["location"]
		units = channel["units"]

		return {} unless location && item && units

		condition = item["condition"]
		return {} unless condition

		speech = "Today in #{location["city"]}: #{condition["text"]}, the temperature is #{condition["temp"]} #{units["temperature"]}"
		puts "Response: " + speech

		render json: {
			speech: speech,
			displayText: speech,
			source: "apiai-weather"
		}
	end
end
