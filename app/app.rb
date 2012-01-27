require 'bundler/setup'
Bundler.require

root = File.expand_path('../..', __FILE__)
set :root, root
set :views, File.join(settings.root, 'app', 'views')


Dir["#{File.dirname(__FILE__)}/controllers/**/*.rb"].each {|f| require f}
