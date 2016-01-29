require 'journey_log'

describe JourneyLog do
  let(:journey) {double(:journey)}
  subject(:journeylog) {described_class.new(journey)}

  it 'records a journey' do
    allow(journey).to receive(:entry_station) {'camden'}
    allow(journey).to receive(:exit_station) {'bank'}
    journeylog.record_journey
    expect(journeylog.journey_list).to include(entry_station: "camden", exit_station: "bank")
  end

end
