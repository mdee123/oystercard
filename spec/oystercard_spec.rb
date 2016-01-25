require 'oystercard'

describe Oystercard do

  let(:station) {double(:station)}

  it 'initially has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  context '#top_up' do

    it 'adds £10 to the balance on the card' do
      expect{ subject.top_up 10}.to change{subject.balance}.by 10
    end

    it "has a maximum limit of #{Oystercard::BALANCE_LIMIT} on the card" do
      message = "Maximum balance limit is #{Oystercard::BALANCE_LIMIT} pounds"
      expect{subject.top_up ((Oystercard::BALANCE_LIMIT) + 1)}.to raise_error message
    end

  end

  context 'touching in and out of journeys' do

    it 'can log when a card has initialized a journey' do
      subject.top_up 10
      subject.touch_in(station)
      expect(subject.in_journey?).to be true
    end

    it 'can log when a card has ended a journey' do
      subject.top_up 10
      subject.touch_in(station)
      expect(subject.touch_out).to be nil
    end

    it 'can check whether the card is in journey' do
      subject.top_up 10
      subject.touch_in(station)
      expect(subject.in_journey?).to be true
    end

    it 'can check whether the card is initially NOT in journey' do
      expect(subject.in_journey?).to be false
    end

    it 'errors if min balance is below 1' do
      expect {subject.touch_in(station)}.to raise_error 'Insufficient funds'
    end

    it 'removes min fare from balance during #touch_out' do
      subject.top_up(10)
      subject.touch_in(station)
      expect{subject.touch_out}.to change{subject.balance}.by -1
    end

    it 'can add start station to touch in' do
      subject.top_up 10
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end

  end


end
