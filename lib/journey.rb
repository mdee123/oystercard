require_relative 'oystercard'

class Journey

  PENALTY_FARE = 6
  FARE_MIN = 1

  attr_reader :entry_station, :exit_station

  def set_start(entry_station)
    @entry_station = entry_station
  end

  def set_exit(exit_station)
    @exit_station = exit_station
  end

  def reset
    @entry_station = nil
    @exit_station = nil
  end

  def completed?
   !entry_station.nil? && !exit_station.nil?
  end

  def zone_calc
    (@entry_station.zone - @exit_station.zone).abs
  end

  def fare
    return PENALTY_FARE unless completed?
    FARE_MIN + zone_calc
  end

end
