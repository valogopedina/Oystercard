require 'oystercard'

RSpec.describe Oystercard do

  subject(:oystercard) {described_class.new}

  it 'creates an oystercard' do
    expect(oystercard).to be_a (Oystercard)
  end


  context 'oystercard has a balance' do

   it { is_expected.to respond_to :balance }

   it 'has a balance 0' do
     expect(oystercard.balance).to eq(0)
   end
 end


 context 'oystercard can be topped up ' do

   it { is_expected.to respond_to(:top_up).with(1).argument }

   it 'can be topped up with an amount' do
    expect{oystercard.top_up(10)}.to change{ subject.balance }.by 10
  end

  it 'raises an error if the maximum balance is exceeded' do
    oystercard.top_up(Oystercard::MAXIMUM_BALANCE)
    expect{oystercard.top_up(5)}.to raise_error "Maximum balance of #{Oystercard::MAXIMUM_BALANCE} is exceeded"
  end
end

context 'fare can be deducted' do

  it { is_expected.to respond_to(:deduct).with(1).argument }

  it 'subtracts the value of the argument from the existing balance' do
    expect{oystercard.deduct(10)}.to change{oystercard.balance}.by -10
  end
end

context 'can give the status' do
 
  it 'is initially not in a journey' do
    expect(oystercard).not_to be_in_journey
  end

  it 'can touch in' do
    oystercard.top_up(3)
    oystercard.touch_in
    expect(oystercard).to be_in_journey
  end

  it 'can touch out' do
    oystercard.top_up(4)
    oystercard.touch_in
    oystercard.touch_out
    expect(oystercard).not_to be_in_journey
  end

end

context '#touch_in' do
  it "raises an error if the balance is less then #{Oystercard::MINIMUM_BALANCE}" do
    expect{oystercard.touch_in}.to raise_error 'Your balance is not enough'
  end
end
  


end