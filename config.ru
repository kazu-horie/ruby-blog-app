require './lib/app.rb'
require './lib/route.rb'
require './lib/router.rb'
require './lib/base_controller.rb'
require './lib/response.rb'

run App.new(Router.new)
