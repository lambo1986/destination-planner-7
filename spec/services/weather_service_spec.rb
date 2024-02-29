require "rails_helper"

RSpec.describe WeatherService, type: :service do
  describe "#get_weather", vcr: { cassette_name: "WeatherService/get_weather" } do
    it "returns a hash" do
      weather = WeatherService.new.get_weather(30.0, 90.0)

      expect(weather).to be_a(Hash)
    end
  end
end
