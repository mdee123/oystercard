require 'oystercard'

describe Oystercard do
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

  context '#deduct' do

    it 'it deducts an amount from the balance' do
      subject.top_up(10)
      expect{ subject.deduct 5}.to change{subject.balance}.by -5
    end

  end


end
