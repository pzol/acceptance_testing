require 'bundler/setup'
Bundler.require(:default, :test)

### load the web application 
require File.expand_path('../../app/app.rb', __FILE__)

### tell capybara to use our sinatra application for testing
Capybara.app = Sinatra::Application
# Capybara.default_driver = :webkit

### syntactic sugar
module AccepteanceTests
  def self.included(base)
    base.instance_eval do
      alias :background :before
      alias :scenario :it
    end
  end
end
RSpec.configuration.include AccepteanceTests

Kernel.class_eval do
  alias :story :describe
end

### include all support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
