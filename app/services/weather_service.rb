require "net/http"
require "json"

class WeatherService
  def self.get_weather(lat, lng)
    api_key = ENV["STORMGLASS_API_KEY"]

    return nil if api_key.blank?

    url = URI(
      "https://api.stormglass.io/v2/weather/point?lat=#{lat}&lng=#{lng}&params=airTemperature"
    )

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = api_key

    response = http.request(request)

    data = JSON.parse(response.body)

    Rails.logger.info(data.inspect)

    data
  rescue => e
    Rails.logger.error("Weather Error: #{e.message}")
    nil
  end
end
