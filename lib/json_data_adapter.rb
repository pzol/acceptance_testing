class JsonDataAdapter
  def initialize(filename)
    @filename = filename
  end

  def read
    File.foreach(@filename) do |line|
      row = JSON.parse(line)

      copy_keys = %w[contract facility method product]
      filtered = {}
      copy_keys.each { |key| filtered[key.to_sym] = row[key] if copy_keys.include? key }
      filtered[:date] = mongo_date_to_time(row['date'])
      filtered[:time_taken] = row['time_taken'].to_i
      yield filtered
    end
  end

  private
  def mongo_date_to_time(mongo_date)
    date = mongo_date['$date']
    Time.at(date.to_i/1000) # mongo dumps miliseconds since epoch
  end
end
