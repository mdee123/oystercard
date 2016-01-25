require 'oystercard'

describe Oystercard do
  subject(:oystercard) {described_class.new}

  describe "#balance" do
    it "is initialised with a balance of 0 by default" do
      expect(oystercard.balance).to eq 0
    end
  end

  describe '::top_up' do
    it 'adds the value specified to the balance' do
      value = rand(100)
      expect{oystercard.top_up(value)}. to change{ oystercard.balance }.from(0).to(value)
    end
  end

end
