require 'bundler/setup'
Bundler.require(:default)

set :root, File.expand_path('../..', __FILE__)
set :views, File.join(settings.root, 'app', 'views')

Dir[File.join(settings.root, 'lib/**/*.rb')].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/controllers/**/*.rb"].each {|f| require f}

