
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
 end






end