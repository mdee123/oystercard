class Oystercard

  BALANCE_LIMIT = 90
  MIN_FARE = 1


  attr_reader :balance

  def initialize
    @balance = 0
    @journey = false
  end

  def top_up(amount)
    raise 'Maximum balance limit is 90 pounds' if amount + balance > BALANCE_LIMIT
    @balance += amount
  end

  def touch_in
    fail 'Insufficient funds' if @balance < MIN_FARE
    @journey = true
  end

  def touch_out
    deduct(MIN_FARE)
    @journey = false
  end

  def in_journey?
    @journey
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
