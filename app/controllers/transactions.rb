get '/' do 
  data_path = File.join(settings.root, 'spec', 'data.json')
  @transactions = LatestTransactionsContext.new.call(data_path, params)
  haml :transactions
end
