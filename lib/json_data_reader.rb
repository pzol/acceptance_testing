class JsonDataReader
  def initialize(filename)
    @filename = filename
  end

  def read
    File.foreach(@filename) do |line|
      yield JsonDataAdapter.convert(line)
    end
  end

end
