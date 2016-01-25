
require 'oystercard'

RSpec.describe Oystercard do

	subject(:oystercard) {described_class.new}

	context 'oystercard methods' do

		it 'creates an oystercard' do
		expect(oystercard).to be_a (Oystercard)
		end
		
		it 'has a balance 0' do
		expect(oystercard.balance).to eq(0)
		end
	end




	
end