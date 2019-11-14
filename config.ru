# ファイルをロード
require './lib/file_loader.rb'

use Rack::Auth::Basic do |username, password|
  username == ENV['AUTH_USER_NAME'] && password == ENV['AUTH_PASSWORD']
end

use Rack::MethodOverride

router = Router.new(
  File.open(File.join('./config', 'routes.rb'), &:read)
)
run App.new(router)
