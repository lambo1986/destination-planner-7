require "rails_helper"

RSpec.describe WeatherService, vcr: true, type: :service do
  describe "#get_weather" do
    it "returns a hash" do
      weather = WeatherService.new.get_weather(30.0, 90.0)

      expect(weather).to be_a(Hash)
    end
  end

  describe "#get_weather_coords" do
    it "returns a hash" do
      coords = WeatherService.new.get_weather_coords("New Orleans", "70117")

      expect(coords).to be_a(Hash)
      expect(coords[:lat]).to be_a(Float)
      expect(coords[:lon]).to be_a(Float)
    end
  end
end
