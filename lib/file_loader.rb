# Ruby / Gem package
require 'rack'
require 'mysql2'
require 'bcrypt'
require 'dotenv/load'

# my Library
Dir[File.join(File.dirname(__FILE__), '../lib/**/*.rb')].each { |f| require f }

# my Applicaion File
# controllers
Dir[File.join(File.dirname(__FILE__), '../app/controllers/*.rb')]
  .each { |f| require f }
# models
Dir[File.join(File.dirname(__FILE__), '../app/models/**/*.rb')]
  .each { |f| require f }
