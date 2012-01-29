require 'spec_helper'
require 'transaction_filter'
require 'models/transaction'
require 'json_data_adapter'
require 'transaction_reader'

describe TransactionReader do
  let(:path) { File.expand_path('../../data.json', __FILE__)  }

  it 'should read all lines' do
    adapter = TransactionReader.new(path)

    db = []
    adapter.read {|row| db << row }

    # should read all
    db.should have(100).records

    # all date should be in the right range
    min_date = db.min { |a, b| a.timestamp <=> b.timestamp }.timestamp
    max_date = db.max { |a, b| a.timestamp <=> b.timestamp }.timestamp
    min_date.to_s.should == '2012-01-20 13:53:29 +0100'
    max_date.to_s.should == '2012-01-20 14:50:51 +0100'

    # time_taken should be all Fixnum
    db.all? { |e| e.time_taken.should be_a(Fixnum)  }
  end

  it 'should find by time_taken' do
    rows = TransactionReader.new(path).find(time_taken: 20_000)
    rows.count.should == 5
    rows.all? { |row| row.time_taken.should > 20_000}
  end

  it 'should return by default only 20 items' do
    rows = TransactionReader.new(path).find
    rows.count.should == 20
  end

  it 'should return only as many rows as specified in limit' do
    rows = TransactionReader.new(path).find({}, {limit: 10})
    rows.count.should == 10
  end
end
