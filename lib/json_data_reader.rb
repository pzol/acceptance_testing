class JsonDataReader
  def initialize(filename)
    @filename = filename
  end

  def read
    File.foreach(@filename) do |line|
      yield JsonDataAdapter.convert(line)
    end
  end

  def find(selector={}, opts={limit: 20})
    @filter = TransactionFilter.new(selector)
    [].tap do |data|
      read do |row|
        data << row if @filter.allowed?(row)
        break if data.length >= opts[:limit]
      end
    end

  end
end
