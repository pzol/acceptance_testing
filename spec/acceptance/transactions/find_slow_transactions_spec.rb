require 'acceptance_helper'

story 'Developer can find long running transactions' do

  scenario 'can search by time_taken' do
    user = TestUser.new
    user.visit '/'

    user.sees! 'timestamp'
    user.sees! '2012-01-27 20:09:10'
  end

  scenario 'sees an error messages when entering an invalid value' do
  end
  
end
