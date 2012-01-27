class TestUser
  include Capybara::DSL
  include Capybara::RSpecMatchers
  include Role::Verifier
end

