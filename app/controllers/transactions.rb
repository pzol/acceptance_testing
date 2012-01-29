get '/' do 
  data_path = File.join(settings.root, 'spec', 'data.json')
  @transactions = FindTransactionsContext.new.call(data_path, params)
  haml :transactions
end
