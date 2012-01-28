Dir["#{File.dirname(__FILE__)}/*.rb"].reject{|f| f =~ /_spec.rb$/}.each {|f| require f}
