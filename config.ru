# ファイルをロード
require './lib/file_loader.rb'

use Rack::MethodOverride

router = Router.new(
  File.open(File.join('./config', 'routes.rb'), &:read)
)
run App.new(router)
