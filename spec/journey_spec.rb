require 'journey'

describe Journey do
  subject(:journey) { described_class.new }

  describe "#start_journey" do
    it { is_expected.to respond_to( :start_journey ).with(1).argument }

    it "entry_station will contain the name of the station" do
      journey.start_journey("Victoria")
      expect(journey.entry_station.has_key?("Victoria")).to eq true
    end
  end

  describe "#end_journey" do

    it "returns an array with start, end station and zones" do
      journey.start_journey("Victoria")
      expect(journey.end_journey("Kingston")).to eq [ {"Victoria" => 0}, {"Kingston" => 0}]

    end
  end

end
