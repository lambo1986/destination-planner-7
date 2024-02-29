class WeatherService
  def initialize
    @base_url_weather = "https://api.openweathermap.org/data/3.0/onecall"
    @base_url_geo = "http://api.openweathermap.org/geo/1.0"
    @api_key = Rails.application.credentials.open_weather[:weather]
  end

  def get_weather(lat, lon)
    data = get_url("#{@base_url_weather}?lat=#{lat}&lon=#{lon}&appid=#{@api_key}")
  end

  def get_weather_coords(name, zip_code)
    data = get_url("#{@base_url_geo}/direct?q=#{name},#{zip_code}&appid=#{@api_key}&limit=1")
    data.first
  end

  private

  def get_url(url)
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
