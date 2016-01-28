
class Oystercard

	attr_reader :balance, :entry_station, :exit_station, :history, :journey
	#def balance
	#  @balance
	#end

	MAXIMUM_BALANCE = 90
	MINIMUM_BALANCE = 1
  MINIMUM_FARE = 3

  def initialize
    @balance = 0
    @history = []
  end

  def top_up num
    raise "Maximum balance of #{MAXIMUM_BALANCE} is exceeded" if (balance + num) > MAXIMUM_BALANCE
    @balance += num
  end

  def in_journey?
		entry_station != nil ? true : false # Ternary Operator
	end

	def touch_in(entry_station)
		fail 'Your balance is not enough' if balance < MINIMUM_BALANCE
		@entry_station = entry_station
    start_journey
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @exit_station = exit_station
    end_journey
    @entry_station = nil
  end

  def start_journey
    @journey = {}
    @journey[entry_station] = nil # started a journey (incomplete)
  end

  def end_journey
    @journey[entry_station] = exit_station # ended our journey (complete)
    history.push(@journey)
  end

  private

  def deduct num
    @balance -= num #=> @balance = @balance - num
  end

end
