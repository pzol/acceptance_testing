class TestUser
  include RSpec::Matchers
  include Capybara::DSL
  include Capybara::RSpecMatchers
  include Role::Navigator
  include Role::Verifier
end
