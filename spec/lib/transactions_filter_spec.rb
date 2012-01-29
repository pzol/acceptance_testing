require 'spec_helper'
require 'models/transaction'
require 'transaction_filter'

describe TransactionFilter do
  it 'should allow anything if no parameters are given' do
    filter = TransactionFilter.new({})
    transaction = Transaction.new({time_taken: 2_000, method: 'method'})
    filter.allowed?(transaction).should be_true
  end

  it 'should allow anything if an invalid time_taken value is given' do
    filter = TransactionFilter.new(time_taken: 'xyz')
    transaction = Transaction.new({time_taken: 2_000})
    filter.allowed?(transaction).should be_true
  end

  it 'should allow filtering by time_taken' do
    filter = TransactionFilter.new({:time_taken => 20_000})

    transaction = Transaction.new
    transaction.time_taken = 20_100
    filter.allowed?(transaction).should be_true
    transaction.time_taken = 19_900
    filter.allowed?(transaction).should be_false
  end

  it 'should allow anything when by method is empty' do
    filter = TransactionFilter.new({method: ''})
    transaction = Transaction.new({time_taken: 2_000, method: 'method'})
    filter.allowed?(transaction).should be_true
  end

  it 'should not allow if the methods differ' do
    filter = TransactionFilter.new({method: 'test'})
    transaction = Transaction.new({time_taken: 2_000, method: 'method'})
    filter.allowed?(transaction).should_not be_true
  end

end
