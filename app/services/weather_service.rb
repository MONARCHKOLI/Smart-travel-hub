require 'net/http'
require 'json'

class WeatherService
  def self.get_weather(lat, lng)
    api_key = Rails.application.credentials.stormglass[:api_key]

    url = URI(
      "https://api.stormglass.io/v2/weather/point?lat=#{lat}&lng=#{lng}&params=airTemperature"
    )

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)

    request["Authorization"] = api_key

    response = http.request(request)

    JSON.parse(response.body)
  end
end