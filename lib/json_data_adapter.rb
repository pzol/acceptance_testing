module JsonDataAdapter
  extend self
  def convert(line)
    row = JSON.parse(line)

    copy_keys = %w[contract facility method product]
    transaction = Transaction.new
    copy_keys.each { |key| transaction.send("#{key}=".to_sym, row[key]) if copy_keys.include? key }
    transaction.timestamp = mongo_date_to_time(row['date'])
    transaction.time_taken = row['time_taken'].to_i
    transaction
  end

  private
  def mongo_date_to_time(mongo_date)
    date = mongo_date['$date']
    Time.at(date.to_i/1000) # mongo dumps miliseconds since epoch
  end
end
