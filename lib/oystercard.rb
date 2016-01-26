class Oystercard

	attr_reader :balance

	MAXIMUM_BALANCE = 90

	def initialize
		@balance = 0
		@in_journey = false
	end

	def top_up num
		maximum_balance = MAXIMUM_BALANCE
		raise 'Maximum balance of #{maximum_balance} is exceeded' if (@balance + num) > MAXIMUM_BALANCE
		@balance += num
	end

	def deduct num
		@balance -= num
	end

	def in_journey?
		@in_journey
	end

	def touch_in
		@in_journey = true
	end

	def touch_out
		@in_journey = false
	end

end
