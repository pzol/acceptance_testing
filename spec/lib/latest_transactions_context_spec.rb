require 'spec_helper'
require 'json_data_adapter'
require 'latest_transactions_context'

describe LatestTransactionsContext do
  it 'should provide a list of transactions' do
    context = LatestTransactionsContext.new
    path = File.expand_path('../../data.json', __FILE__) 
    data = context.call(path, 20)

    data.should have(20).rows
  end
end
