class Oystercard

  attr_reader :balance
  BALANCE_MAX = 90

  def initialize
    @balance = 0
  end

  def top_up(value)
    max_balance = BALANCE_MAX
    raise 'Top-up exceeds maximum limit of #{max_balance}' if @balance + value > 90
    @balance += value
  end

end
