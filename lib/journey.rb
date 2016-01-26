require_relative 'station'
require_relative 'oystercard'

class Journey

  def in_journey?
    !!@entry_station
  end

end
