class Weather
  attr_reader :date, :temp, :summary, :low, :high

  def initialize(attrs)
    current = attrs[:current] || {}
    daily_first = attrs[:daily]&.first || {}

    @date = format_date(current[:dt])
    @temp = kelvin_to_f(current[:temp])
    @summary = daily_first[:summary] || "Summary not available"
    @low = kelvin_to_f(daily_first.dig(:temp, :min))
    @high = kelvin_to_f(daily_first.dig(:temp, :max))
  end

  private

  def format_date(unix_timestamp)
    Time.at(unix_timestamp.to_i).strftime("%a %b %d %Y") if unix_timestamp
  end

  def kelvin_to_f(kelvin)
    kelvin ? ((kelvin - 273.15) * 9/5 + 32).round(1) : nil
  end
end
