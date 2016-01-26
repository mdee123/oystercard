require 'journey'
require 'oystercard'

describe Journey do

  let(:oystercard) {double(:oystercard, touch_in: nil, touch_out: nil)}

  describe '#touch_in(station)' do
    it 'sets the oystercard to being in journey' do
      subject.top_up(Oystercard::FARE_MIN)
      subject.touch_in(entry_station)
      allow(oystercard).to receive(:touch_in).and_return(true)
      expect(subject.in_journey?).to eq true
    end
  end

  describe '#touch_out' do
    it 'sets the oystercard to being off journey' do
      allow(oystercard).to receive(:touch_out).and_return(false)
      expect(subject.in_journey?).to eq false
    end
  end

  describe '#in_journey?' do
    it 'checks that when initialised the card is not in journey' do
      expect(subject).to_not be_in_journey
    end
  end

end
