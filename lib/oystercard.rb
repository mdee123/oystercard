require_relative 'station'
require_relative 'journey'

class Oystercard

  attr_reader :balance, :journey
  BALANCE_MAX = 90
  FARE_MIN = 1

  def initialize(journey = Journey.new)
    @balance = 0
    @journey = journey
  end

  def top_up(value)
    max_balance = BALANCE_MAX
    raise 'Top-up exceeds maximum limit of #{max_balance}' if @balance + value > BALANCE_MAX
    @balance += value
  end

  def touch_in(entry_station)
    raise 'Please top up your card.' if @balance < FARE_MIN
    journey.set_start(entry_station)
  end

  def touch_out(exit_station)
    deduct(FARE_MIN)
    journey.set_exit(exit_station)
  end


  private

  def deduct(value)
    @balance -= value
  end

end
