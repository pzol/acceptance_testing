require 'spec_helper'
require 'transaction'
require 'transaction_filter'

describe TransactionFilter do
  it 'should allow anything if time_taken is not given' do
    params = {}
    filter = TransactionFilter.new(params)
    transaction = Transaction.new
    transaction.time_taken = 2_000
    filter.allowed?(transaction).should be_true
  end

  it 'should allow filtering by time_taken' do
    params = {:time_taken => 20000}
    filter = TransactionFilter.new(params)

    transaction = Transaction.new
    transaction.time_taken = 20_100
    filter.allowed?(transaction).should be_true
    transaction.time_taken = 19_900
    filter.allowed?(transaction).should be_false

  end

end
