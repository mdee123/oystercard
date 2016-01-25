class Oystercard

  attr_reader :balance
  BALANCE_MAX = 90
  BALANCE_MIN = 1

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(value)
    max_balance = BALANCE_MAX
    raise 'Top-up exceeds maximum limit of #{max_balance}' if @balance + value > BALANCE_MAX
    @balance += value
  end

  def deduct(value)
    raise 'Top-up exceeds maximum limit of #{max_balance}' if @balance - value < 0
    @balance -= value
  end

  def touch_in
    raise 'Please top up your card.' if @balance < BALANCE_MIN
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

  def in_journey?
    @in_use
  end

end
