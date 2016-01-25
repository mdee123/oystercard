class Oystercard

  BALANCE_LIMIT = 90
  MIN_FARE = 1


  attr_reader :balance, :entry_station

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)
    raise 'Maximum balance limit is 90 pounds' if amount + balance > BALANCE_LIMIT
    @balance += amount
  end

  def touch_in(station)
    fail 'Insufficient funds' if @balance < MIN_FARE
    @entry_station = station
  end

  def touch_out
    deduct(MIN_FARE)
    @entry_station = nil
  end

  def in_journey?
    !!@entry_station
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
