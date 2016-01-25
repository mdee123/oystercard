require 'oystercard'

describe Oystercard do
  it 'initially has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

end
