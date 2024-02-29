require "rails_helper"

RSpec.describe WeatherFacade, vcr: true do
  describe "#fetch_weather" do
    it "sends a zip and city and gets back a weather response" do
      weather = WeatherFacade.new.fetch_weather("New Orleans", "70115")

      expect(weather).to be_instance_of(Weather)
    end
  end

  describe "#fetch_gif" do
    it "makes a facade of the gif url from a summary" do
      summary = "Mostly Cloudy"
      gif = WeatherFacade.new.fetch_gif(summary)

      expect(gif).to be_a(String)
    end
  end
end
