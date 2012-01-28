class LatestTransactionsContext

  def call(data_path, max_items=20)
    @adapter = JsonDataAdapter.new(data_path)  
    @data = []
    i = 0 
    @adapter.read do |row| 
      break if i >= max_items
      @data << row
      i += 1 
    end
    @data
  end

end
