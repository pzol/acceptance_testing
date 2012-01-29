require 'spec_helper'
require 'json_data_adapter'
require 'models/transaction'
require 'transaction_filter'
require 'transaction_reader'
require 'contexts/find_transactions_context'

describe FindTransactionsContext do
  it 'should provide a list of transactions' do
    context = FindTransactionsContext.new
    path = File.expand_path('../../data.json', __FILE__) 
    data = context.call(path, {}, 20)

    data.should have(20).rows
  end
end
