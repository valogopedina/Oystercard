class Oystercard

	attr_reader :balance
	#def balance
	#  @balance
	#end

	MAXIMUM_BALANCE = 90
	MINIMUM_BALANCE = 1

	def initialize
		@balance = 0
		@in_journey = false
	end

	def top_up num
		raise "Maximum balance of #{MAXIMUM_BALANCE} is exceeded" if (balance + num) > MAXIMUM_BALANCE
		@balance += num
	end

	def deduct num
		@balance -= num
	end

	def in_journey?
		@in_journey
	end

	def touch_in
		fail 'Your balance is not enough' if balance < MINIMUM_BALANCE
		@in_journey = true
	end

	def touch_out
		@in_journey = false
	end

end
