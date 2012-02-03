require 'acceptance_helper'
require_relative 'page_helper'

# This spec shows how you can using the TestUser context object work around
# Capybara resetting the session after each example
describe 'Developers can search transactions for a specific method (old style capybara)' do
  attr_accessor :user 

  before(:all) do
    @user = TestUser.new.extend(Role::TransactionsBrowser) 
    user.extend(Role::MethodSearcher)
  end

  it 'Given I am on the latest transactions page' do
    user.visit_latest_transactions
  end

  it 'when I search for transactions by method' do
    user.searches_by_method('hotels')
  end

  it 'then I see the transactions with my selected method only' do
    user.sees_transactions_table!
    user.all_table_rows { |tr| tr.method.should == 'hotels' }
    user.page.should have_field 'method', :with => 'hotels'
  end
end
