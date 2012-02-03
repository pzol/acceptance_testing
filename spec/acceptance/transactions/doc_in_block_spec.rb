require 'acceptance_helper'
require_relative 'page_helper'

# This spec shows another way of creating and at the same time documenting a story
# with inline documentation, which will be appended to the scenario's description
describe 'Developers can search transactions for a specific method (doc in block)' do

  scenario 'search' do
    user = TestUser.new.extend(Role::TransactionsBrowser) 
    user.extend(Role::MethodSearcher)

    _ 'Given I am on the latest transactions page'
    user.visit_latest_transactions

    _ 'When I search for transactions by method'
    user.searches_by_method('hotels')

    _ 'Then I see the transactions with my selected method only'
    user.sees_transactions_table!
    user.all_table_rows { |tr| tr.method.should == 'hotels' }
    user.page.should have_field 'method', :with => 'hotels'
  end
end
