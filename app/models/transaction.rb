class Transaction
  include ActiveModel::Validations

  attr_accessor :contract, :facility, :method, :product, :timestamp, :time_taken
  validates :time_taken, :numericality => { :only_integer => true }

  def attributes
    { contract: contract, facility: facility, method: method, 
      product: product, timestamp: timestamp, time_taken: time_taken}
  end
end
