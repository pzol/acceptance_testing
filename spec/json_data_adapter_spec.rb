require 'spec_helper'
require 'json_data_adapter'

describe JsonDataAdapter do
  it 'should read all lines' do
    path = File.expand_path('../data.json', __FILE__) 
    adapter = JsonDataAdapter.new(path)

    db = []
    adapter.read {|row| db << row }

    # should read all
    db.should have(100).records

    # should only contain the selected keys
    allowed_keys = [:timestamp, :facility, :product, :method, :contract, :time_taken]
    db.all? { |e| e.keys.should include *allowed_keys }

    # all date should be in the right range
    min_date = db.min { |a, b| a[:timestamp] <=> b[:timestamp] }[:timestamp]
    max_date = db.max { |a, b| a[:timestamp] <=> b[:timestamp] }[:timestamp]
    min_date.to_s.should == '2012-01-20 13:53:29 +0100'
    max_date.to_s.should == '2012-01-20 14:50:51 +0100'

    # time_taken should be all Fixnum
    db.all? { |e| e[:time_taken].should be_a(Fixnum)  }
  end
end
