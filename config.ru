# ファイルをロード
require './lib/file_loader.rb'

router = Router.new(
  File.open(File.join('./config', 'routes.rb'), &:read)
)
run App.new(router)
