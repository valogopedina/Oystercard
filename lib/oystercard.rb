require 'journey' 

class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :this_journey 

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 3

  def initialize
    @balance = 0
  end

  def top_up num
    raise "Maximum balance of #{MAXIMUM_BALANCE} is exceeded" if (balance + num) > MAXIMUM_BALANCE
    @balance += num
  end

  def in_journey?
   !!@entry_station #!= nil ? true : false 
  end

  def touch_in(entry_station)
    fail 'Your balance is not enough' if balance < MINIMUM_BALANCE
    @entry_station = entry_station
    this_journey.start_journey(entry_station)
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    this_journey.end_journey(exit_station)
    @entry_station = nil
  end

  def this_journey
    @this_journey ||= Journey.new
  end

  private

  def deduct num
    @balance -= num
  end

end
