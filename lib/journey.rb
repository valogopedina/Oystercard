class Journey

  attr_reader :entry_station
  attr_reader :exit_station

  def start_journey(entry_station)
    @entry_station = { entry_station => 0}
  end

  def end_journey(exit_station)
    @exit_station = { exit_station => 0}
    result = [@entry_station, @exit_station]
    @entry_station = nil
    @exit_station = nil
    result
  end
end
