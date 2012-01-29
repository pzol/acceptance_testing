require 'spec_helper'
require 'models/transaction'

describe Transaction do
  it 'should validate time_taken as an integer' do
    t = Transaction.new
    t.time_taken = 'xyz'
    t.should_not be_valid
  end

  it 'should initialize with a hash' do
    hash = { contract: 'contract', facility: 'facility', method: 'method', 
      product: 'product', timestamp: Time.at(13000000), time_taken: 100}
      transaction = Transaction.new(hash)

      transaction.contract.should == 'contract'
      transaction.facility.should == 'facility'
      transaction.method.should == 'method'
      transaction.product.should == 'product'
      transaction.timestamp.should == Time.at(13000000)
      transaction.time_taken.should == 100
      transaction.should be_valid
  end

end
