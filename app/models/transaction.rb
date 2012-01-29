class Transaction
  include ActiveModel::Validations

  attr_accessor :contract, :facility, :method, :product, :timestamp, :time_taken
  validates :time_taken, :numericality => { :only_integer => true }

  def initialize(hash={})
    hash.each do |key, value| 
      method = "#{key}=".to_sym
      send(method, value) if respond_to? method
    end
  end

  def attributes
    { contract: contract, facility: facility, method: method, 
      product: product, timestamp: timestamp, time_taken: time_taken}
  end
  
end
