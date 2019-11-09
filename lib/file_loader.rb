# Ruby / Gem package
require 'rack'

# my Library
Dir[File.join(File.dirname(__FILE__), '../lib/**/*.rb')].each { |f| require f }

# my Applicaion File
Dir[File.join(File.dirname(__FILE__), '../app/controllers/*.rb')]
  .each { |f| require f }
