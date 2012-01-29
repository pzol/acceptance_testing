class LatestTransactionsContext

  def call(data_path, params, max_items=20)
    @adapter = JsonDataReader.new(data_path)
    @filter = TransactionFilter.new(params)
    @data = []
    i = 0 
    @adapter.read do |row| 
      break if i >= max_items
      @data << row if @filter.allowed?(row)
      i += 1 
    end
    @data
  end

end
