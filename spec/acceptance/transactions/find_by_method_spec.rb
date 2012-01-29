require 'acceptance_helper'
require_relative 'page_helper'

story 'Developers can search transactions for a specific method' do
  scenario 'search' do
    user = TestUser.new.extend(Role::TransactionsBrowser) 
    user.extend(Role::MethodSearcher)
    user.visit_latest_transactions
    user.sees_transactions_table!

    user.searches_by_method(method = 'hotels')
    user.sees_transactions_table!

    user.all_table_rows { |tr| tr.method.should == method }
    user.page.should have_field 'method', :with => method
  end
end
