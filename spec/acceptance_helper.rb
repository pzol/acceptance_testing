require_relative 'spec_helper'

### load the web application 
require File.expand_path('../../app/app.rb', __FILE__)

### tell capybara to use our sinatra application for testing
Capybara.app = Sinatra::Application

### syntactic sugar to make the dsl look as I want to 
require 'acceptance/dsl.rb'

### include all support files
Dir["#{File.dirname(__FILE__)}/acceptance/support/**/*.rb"].each {|f| require f}
