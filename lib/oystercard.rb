class Oystercard

	attr_reader :balance

	MAXIMUM_BALANCE = 90

	def initialize
		@balance = 0
	end

  	def top_up num
  		maximum_balance = MAXIMUM_BALANCE
  		raise 'Maximum balance of #{maximum_balance} is exceeded' if (@balance + num) > MAXIMUM_BALANCE
  			@balance += num
  	end

end
