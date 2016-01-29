require 'oystercard'


describe Oystercard do

  before do
    allow(journeylog).to receive(:new) {journeylog}
  end

  let(:journey) {double(:journey)}
  let(:journeylog) {double(:journeylog)}
  let(:oystercard) {described_class.new(journeylog(journey))}
  let(:entry_station) {double (:entry_station)}
  let(:exit_station) {double (:exit_station)}


  describe "#balance" do
    it "is initialised with a balance of 0 by default" do
      expect(oystercard.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'adds the value specified to the balance' do
      value = rand(Oystercard::BALANCE_MAX)
      expect{oystercard.top_up(value)}.to change{ oystercard.balance }.from(0).to(value)
    end
  end

  describe '#top_up' do
    it 'raises an error if topping up more than the max limit' do
      oystercard.top_up(Oystercard::BALANCE_MAX)
      error = "Top-up exceeds maximum limit of #{Oystercard::BALANCE_MAX}"
      expect{ oystercard.top_up(1) }.to raise_error(error)
    end
  end

  describe '#touch_in(station)' do
    it 'raises an exception if the balance is inferior to £1' do
      expect{ oystercard.touch_in(entry_station) }.to raise_error 'Please top up your card.'
    end

    it 'sets an incomplete journey if you touch in twice' do
      oystercard.top_up(10)
      allow(journey).to receive(:entry_station) {'camden'}
      allow(journey).to receive(:exit_station) {nil}
      oystercard.touch_in(entry_station)
      oystercard.touch_in(entry_station)
      expect(oystercard.history).to include({entry_station: 'camden', exit_station: nil})
    end
  end
  #
  # describe '#touch_out' do
  #   it 'reduces the balance by the minimum fare' do
  #     expect{oystercard.touch_out(exit_station)}.to change { oystercard.balance }.by -Journey::FARE_MIN
  #   end
  #
  #   it 'sets an incomplete journey if you don\'t touch in' do
  #     oystercard.top_up(10)
  #     oystercard.touch_out(exit_station)
  #     expect(oystercard.journey.journey_list).to include(nil => exit_station)
  #   end
  # end
  #
  #
  # describe '#entry_station' do
  #   it 'remembers the entry station after touch in' do
  #     oystercard.top_up(10)
  #     oystercard.touch_in(entry_station)
  #     expect(oystercard.journey.entry_station).to eq entry_station
  #   end
  # end


end
