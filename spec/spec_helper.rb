require 'bundler/setup'
Bundler.require(:default, :test)

# Add lib to load path
$LOAD_PATH << File.expand_path('../../lib', __FILE__)
$LOAD_PATH << File.expand_path('../../app/models', __FILE__)
