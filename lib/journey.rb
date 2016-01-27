require_relative 'oystercard'

class Journey

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
    @in_journey = false
    @journey_list[@entry_station] = exit_station
    @entry_station = nil
    @exit_station = exit_station
  end

  def in_journey?
    @in_journey
  end

end
