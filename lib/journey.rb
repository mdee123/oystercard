require_relative 'oystercard'

class Journey

  PENALTY_FARE = 6
  FARE_MIN = 1

  def initialize
    @in_journey = false
  end

  def set_in_journey(arg)
    @in_journey = arg
  end

  def in_journey?
    @in_journey
  end

  def penalty_fare?
    (!entry_station || !exit_station)
  end

  def fare
    return PENALTY_FARE if penalty_fare?
    FARE_MIN
  end

end
