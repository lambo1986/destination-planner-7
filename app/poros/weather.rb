class Weather
  attr_reader :date, :temp, :summary, :low, :high

  def initialize(attrs)
    @date = format_date(attrs[:current][:dt])
    @temp = kelvin_to_f(attrs[:current][:temp])
    @summary = attrs[:daily].first[:summary]
    @low = kelvin_to_f(attrs[:daily].first[:temp][:min])
    @high = kelvin_to_f(attrs[:daily].first[:temp][:max])
  end

  private

  def format_date(unix_timestamp)
    Time.at(unix_timestamp.to_i).strftime("%a %b %d %Y")
  end

  def kelvin_to_f(kelvin)
    ((kelvin - 273.15) * 9/5 + 32).round(1)
  end
end
