class WeatherFacade

  def fetch_weather(city, zip)
    service = WeatherService.new
    response = service.get_weather_coords(city, zip)
    callback = service.get_weather(response[:lat], response[:lon])
    weather = Weather.new(callback)
  end

  def fetch_gif(weather_summary)
    service = WeatherService.new
    response = service.weather_image_url(weather_summary)
  end
end
