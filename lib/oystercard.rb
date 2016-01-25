class Oystercard

  BALANCE_LIMIT = 90
  MIN_FARE = 1


  attr_reader :balance, :entry_station, :exit_station, :journeys

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journeys = {}

  end

  def top_up(amount)
    raise 'Maximum balance limit is 90 pounds' if amount + balance > BALANCE_LIMIT
    @balance += amount
  end

  def touch_in(station)
    fail 'Insufficient funds' if @balance < MIN_FARE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @journeys[@entry_station] = station
    @exit_station = station
  end

  def in_journey?
    !!@entry_station
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
