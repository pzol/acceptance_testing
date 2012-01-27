require 'spec_helper'

story 'Find slow transactions' do

  scenario 'should work' do
    user = TestUser.new
    user.visit '/'

    user.sees! 'timestamp'
    user.sees! '2012-01-27 20:09:10'
  end
  
end
