
class JourneyLog

  attr_reader :journey_list

  def initialize(journey=Journey.new)
    @journey = journey
    @journey_list = []
  end

  def record_journey
    @journey_list << {entry_station: @journey.entry_station, exit_station: @journey.exit_station}
  end

end
