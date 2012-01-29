require 'acceptance_helper'
require_relative 'page_helper'

story 'Developers can find slow transactions' do

  scenario 'search by time_taken' do
    # _ 'Given I am on the latest transactions page'
    user = TestUser.new.extend(Role::TransactionsBrowser) 
    user.extend(Role::TimeTakenSearcher)
    user.visit_latest_transactions
    user.sees_transactions_table!
    
    # _ 'When I search for time_taken
    user.searches_for_time_taken(time_taken = 6000)

    # _ 'Then I see only transactions which have time_taken longer than specified
    user.sees_transactions_table!

    user.all_table_rows do |tr|
      tr.time_taken.should > time_taken
    end
  end

  scenario 'sees all messages when entering an invalid value for time_taken' do
    # _ 'Given I am on the latest transactions page'
    user = TestUser.new.extend(Role::TransactionsBrowser) 
    user.extend(Role::TimeTakenSearcher)
    user.visit_latest_transactions

    # _ 'When I search for time_taken with an invalid value 'xyz'
    user.searches_for_time_taken(time_taken = 'xyz')
    user.sees_transactions_table!
    user.table_rows.should have(20).rows
  end
  
end
