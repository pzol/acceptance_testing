require 'spec_helper'
require 'transaction'

describe Transaction do
  it 'should validate time_taken as an integer' do
    t = Transaction.new
    t.time_taken = 'xyz'
    t.should_not be_valid
  end

end
