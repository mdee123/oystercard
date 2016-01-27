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
      subject.set_exit(exit_station)
      expect(subject.in_journey?).to eq false
    end
  end

  describe '#penalty_fair' do
    it "returns the pentalty fair amount" do
      expect(subject.penalty_fair).to eq 6
    end
  end

end
