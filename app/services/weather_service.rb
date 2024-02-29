class WeatherService
  def initialize
    @base_url = "https://api.openweathermap.org/data/3.0/onecall"
    @api_key = Rails.application.credentials.open_weather[:weather]
  end
  def get_weather(lat, lon)
    data = get_url("#{@base_url}?lat=#{lat}&lon=#{lon}&appid=#{@api_key}")
  end

  private

  def get_url(url)
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
