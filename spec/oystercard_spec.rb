require 'oystercard'

describe Oystercard do
  subject(:oystercard) {described_class.new}

  describe "#balance" do

    it "is initialised with a balance of 0 by default" do
      expect(oystercard.balance).to eq 0
    end

  end

end
