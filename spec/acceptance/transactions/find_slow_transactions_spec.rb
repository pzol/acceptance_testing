require 'acceptance_helper'
require_relative 'page_helper'

story 'Developers can find slow transactions' do

  scenario 'can search by time_taken' do
    user = TestUser.new.extend(Role::TransactionsBrowser)
    user.visit_latest_transactions
    # user.is_logged_in!

    user.sees! 'timestamp'
    # user.sees! '2012-01-27 20:09:10'
  end

  scenario 'sees an error messages when entering an invalid value' do
  end
  
end
