require_relative 'station'
require_relative 'journey'
require_relative 'journey_log'
require 'forwardable'

class Oystercard

  extend Forwardable

  def_delegator :@journey_log, :record_journey, :record
  def_delegator :@journey, :reset, :reset
  def_delegator :@journey, :fare, :fare


  attr_reader :balance, :journey
  BALANCE_MAX = 90


  def initialize(journey_log=JourneyLog.new(journey=Journey.new))
    @balance = 0
    @journey_log = journey_log
    @journey = journey
  end

  def top_up(value)
    raise "Top-up exceeds maximum limit of #{BALANCE_MAX}" if (@balance + value) > BALANCE_MAX
    @balance += value
  end

  def touch_in(entry_station)
    raise 'Please top up your card.' if @balance < Journey::FARE_MIN
    if !@journey.entry_station.nil?
      deduct(fare)
      record
      reset
    end
    @journey.set_start(entry_station)
  end

  def touch_out(exit_station)
    @journey.set_exit(exit_station)
    deduct(@journey.fare)
    record
    reset
  end

  def history
    @journey_log.journey_list.clone
  end

  private

  def deduct(value)
    @balance -= value
  end

end
