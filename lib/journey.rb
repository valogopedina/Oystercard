require 'oystercard'

class Journey

  attr_reader  :history

  def initialize
    @history = []
  end

  def start_journey(entry_station)
    @entry_station = entry_station
  end

  def end_journey(exit_station)
    @exit_station = exit_station
    result = {@entry_station=>@exit_station}
    history.push(result)
  end
end
