module JsonDataAdapter
  extend self
  def convert(line)
    row = JSON.parse(line)

    copy_keys = %w[contract facility method product]
    filtered = {}
    copy_keys.each { |key| filtered[key.to_sym] = row[key] if copy_keys.include? key }
    filtered[:timestamp] = mongo_date_to_time(row['date'])
    filtered[:time_taken] = row['time_taken'].to_i
    filtered
  end

  private
  def mongo_date_to_time(mongo_date)
    date = mongo_date['$date']
    Time.at(date.to_i/1000) # mongo dumps miliseconds since epoch
  end
end
