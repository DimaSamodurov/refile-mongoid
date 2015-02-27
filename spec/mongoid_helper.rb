require 'mongoid'
require 'rspec'

Mongoid.configure do |config|
  config.connect_to("refile_mongoid_test")
end

RSpec.configure do |config|
  config.before(:each) do
    Mongoid.purge!
  end
end



