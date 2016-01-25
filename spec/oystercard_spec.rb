require 'oystercard'

describe Oystercard do
  it 'initially has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it 'adds £10 to the balance on the card' do
    value = 10
    subject.top_up(value)
    expect(subject.balance).to eq 10
  end

end
