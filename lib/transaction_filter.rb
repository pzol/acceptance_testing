class TransactionFilter
  def initialize(params)
    @min_time_taken = params[:time_taken].to_i
  end

  def allowed?(row)
    time_taken?(row.time_taken)
  end

  def time_taken?(time_taken)
    return true unless @min_time_taken
    return time_taken >= @min_time_taken 
  end
end
