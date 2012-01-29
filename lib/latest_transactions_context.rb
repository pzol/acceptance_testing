class LatestTransactionsContext

  def call(data_path, params, max_items=20)
    @reader = JsonDataReader.new(data_path)
    @data = @reader.find(params)
  end

end
