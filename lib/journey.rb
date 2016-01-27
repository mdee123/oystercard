require_relative 'oystercard'

class Journey

  PENALTY_FARE = 6
  FARE_MIN = 1

  attr_reader :entry_station, :exit_station, :journey_list

  def initialize
    @entry_station = nil
    @exit_station = nil
    @journey_list = {}
    @in_journey = false
  end

  def set_start(entry_station)
    @in_journey = true
    @entry_station = entry_station
  end

  def set_exit(exit_station)
    @exit_station = exit_station
  end

  def in_journey?
    @in_journey
  end

  def set_journey
      @in_journey = false
      @journey_list[@entry_station] = @exit_station
  end

  def penalty_fare?
    (!entry_station || !exit_station)
  end

  def fare
    return PENALTY_FARE if penalty_fare?
    FARE_MIN
  end

end
