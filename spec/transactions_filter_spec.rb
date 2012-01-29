require 'spec_helper'
require 'transaction_filter'

describe TransactionFilter do
  it 'should allow anything if time_taken is not given' do
    params = {}
    filter = TransactionFilter.new(params)

    filter.allowed?({time_taken: 2000}).should be_true
  end

  it 'should allow filtering by time_taken' do
    params = {:time_taken => 20000}
    filter = TransactionFilter.new(params)

    filter.allowed?({time_taken: 20100}).should be_true
    filter.allowed?({time_taken: 19900}).should be_false

  end

end
