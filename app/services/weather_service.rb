class WeatherService
  def initialize
    @base_url_weather = "https://api.openweathermap.org/data/3.0/onecall"
    @base_url_geo = "http://api.openweathermap.org/geo/1.0"
    @giphy_url = "https://api.giphy.com/v1/gifs"
    @weather_key = Rails.application.credentials.open_weather[:weather]
    @giphy_key = Rails.application.credentials.gif[:giphy]
  end

  def get_weather(lat, lon)
    data = get_url("#{@base_url_weather}?lat=#{lat}&lon=#{lon}&appid=#{@weather_key}")
  end

  def get_weather_coords(name, zip_code)
    data = get_url("#{@base_url_geo}/direct?q=#{name},#{zip_code}&appid=#{@weather_key}&limit=1")
    data.first
  end

  def weather_image_url(weather_info)
    data = get_url("#{@giphy_url}/search?api_key=#{@giphy_key}&q=#{weather_info}&limit=1")
    data[:data].first[:images][:original][:url]
  end

  private

  def get_url(url)
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
