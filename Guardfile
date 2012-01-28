notification :growl

guard 'bundler' do
  watch('Gemfile')
end

# Acceptance Tests
group :acceptance do
  ## override .rspec file options in :cli
  guard 'rspec', :version => 2, :cli => "--color --format nested --fail-fast", :notification => true do
    watch(%r{^spec/.+_spec\.rb$})
  end
end
