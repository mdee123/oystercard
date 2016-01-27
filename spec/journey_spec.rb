require 'journey'
require 'oystercard'

describe Journey do

  let(:oystercard) {Oystercard.new}
  let(:journey) {described_class.new}
  let(:entry_station) {double (:entry_station)}
  let(:exit_station) {double (:exit_station)}

  it 'checks entry station is nil for a new journey' do
    expect(journey.entry_station).to eq nil
  end

  it 'checks entry station is nil for a new journey' do
    expect(journey.exit_station).to eq nil
  end

  describe '#journey_list' do
    it 'checks that the journey list is empty by default' do
      expect(journey.journey_list).to be {}
    end
  end

  describe 'touch_in(station)' do
    it 'sets the oystercard to being in journey' do
      journey.set_start(entry_station)
      expect(journey.in_journey?).to eq true
    end
  end

  describe '#touch_out' do
    it 'sets the oystercard to being off journey' do
      subject.set_start(entry_station)
      subject.set_journey
      expect(subject.in_journey?).to eq false
    end
  end

  describe '#fare' do
    it "returns the pentalty fare amount" do
      expect(subject.fare).to eq 6
    end
  end

  describe '#journey_list' do
    it 'checks that touching in and out creates a journey' do
      journey.set_start(entry_station)
      journey.set_exit(exit_station)
      journey.set_journey
      expect(journey.journey_list).to include(entry_station => exit_station)
    end
  end

  describe '#penalty_fare' do
    it 'checks if the penalty fare should be applied without touch in' do
      journey.set_journey
      expect(journey.penalty_fare?).to eq true
    end

    it 'checks if the penalty fare should be applied without touch out' do
      subject.set_start(entry_station)
      subject.set_journey
      expect(journey.penalty_fare?).to eq true
    end
  end


end
