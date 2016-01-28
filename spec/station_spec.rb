
require 'station'

describe Station do 

  subject(:station) {described_class.new("Piccadilly Circus", 1)}

  it 'returns a name' do
    expect(station.name).to eq "Piccadilly Circus"
  end

  it 'returns a zone number' do
    expect(station.zone).to eq 1
  end


end