require 'acceptance_helper'
require_relative 'page_helper'

story 'Developers can see transactions logs' do

  scenario 'with the latest transactions' do
    # _ 'Given I am on the latest transactions page'
    user = TestUser.new.extend(Role::TransactionsBrowser)
    user.visit_latest_transactions


    # _ 'Then I should see the latest transactions with 
    #    timestamp contract facility method time_taken product'
    user.sees_transactions_table!

    user.table_rows.should have(20).rows
    user.all_table_rows do |tr| 
      tr.timestamp.should be_a DateTime 
      tr.contract.should == 'test'
      tr.facility.should == 'resfinity.api'
      %w[hotel hotels].should include tr.method
      tr.time_taken.should be_a Fixnum
      tr.product.should == 'HOTEL'
    end

  end  

end
