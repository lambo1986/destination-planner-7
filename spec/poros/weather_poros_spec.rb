require "rails_helper"

RSpec.describe Weather do
  describe "initialization" do
    it "exists" do
      attrs = { current:
        { dt: "1709220086",
        temp: 261.64, },
        daily: [
          {
            summary: "Sunrise Will Rock",
            temp: {min: 258.54, max: 270.6 }
            }
          ]
        }


      weather = Weather.new(attrs)

      expect(weather.date).to eq("Thu Feb 29 2024")
      expect(weather.temp).to eq(11.3)
      expect(weather.summary).to eq("Sunrise Will Rock")
      expect(weather.low).to eq(5.7)
      expect(weather.high).to eq(27.4)
    end
  end
end
