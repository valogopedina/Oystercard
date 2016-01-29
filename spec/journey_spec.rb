require 'journey'

describe Journey do
  subject(:journey) { described_class.new }

  describe "#start_journey" do
    it { is_expected.to respond_to( :start_journey ).with(1).argument }

    it "entry_station will contain the name of the station" do
      expect(journey.start_journey("Victoria")).to include("Victoria")
    end
  end

  describe "#end_journey" do

    it "returns an array with start, end station and zones" do
      journey.start_journey("Victoria")
      journey.end_journey("Kingston")
      expect(journey.history).to eq [{"Victoria" => "Kingston"}]
    end
  end

  describe '#history' do
  it 'returns an array that contains hashes of each entry and exit station pair' do
    journey.start_journey("Victoria")
    journey.end_journey("Kingston")
    journey.start_journey("Kingston")
    journey.end_journey("Victoria")
    expect(journey.history).to eq [{"Victoria" => "Kingston"}, {"Kingston" => "Victoria"}]
  end
end

end
