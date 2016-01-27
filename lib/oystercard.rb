require_relative 'station'
require_relative 'journey'

class Oystercard

  attr_reader :balance, :journey
  BALANCE_MAX = 90


  def initialize(journey = Journey.new)
    @balance = 0
    @journey = journey
  end

  def top_up(value)
    raise "Top-up exceeds maximum limit of #{BALANCE_MAX}" if (@balance + value) > BALANCE_MAX
    @balance += value
  end

  def touch_in(entry_station)
    unless journey.in_journey?
      raise 'Please top up your card.' if @balance < Journey::FARE_MIN
      journey.set_start(entry_station)
    else
      journey.set_journey
    end
  end

  def touch_out(exit_station)
    deduct(Journey::FARE_MIN)
    journey.set_exit(exit_station)
    journey.set_journey
  end


  private

  def deduct(value)
    @balance -= value
  end

end
