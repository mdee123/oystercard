class Oystercard
  BALANCE_LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(value)
    raise 'Maximum balance limit is 90 pounds' if (value+@balance) > BALANCE_LIMIT
    @balance += value
  end

end
