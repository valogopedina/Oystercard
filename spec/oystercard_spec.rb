
require 'oystercard'

RSpec.describe Oystercard do

	subject(:oystercard) {described_class.new}

		it 'creates an oystercard' do
    expect(subject).to be_a (Oystercard)
		end


   context 'oystercard has a balance' do
   it { is_expected.to respond_to :balance }

    it 'has a balance 0' do
		expect(subject.balance).to eq(0)
		end
   end


   context 'oystercard can be topped up ' do

   it { is_expected.to respond_to(:top_up).with(1).argument }

   it 'can be topped up with an amount' do
   	expect{subject.top_up(10)}.to change{ subject.balance }.by 10
   end

   it 'raises an error if the maximum balance is exceeded' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    oystercard.top_up(maximum_balance)
    expect{oystercard.top_up(5)}.to raise_error 'Maximum balance of #{maximum_balance} is exceeded'
   end

   context 'fare can be deducted' do

   it { is_expected.to respond_to(:deduct).with(1).argument }

   it 'subtracts the value of the argument from the existing balance' do
    expect{oystercard.deduct(10)}.to change{oystercard.balance}.by -10
   end

   end

 end



end