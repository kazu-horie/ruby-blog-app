class BaseDAO
  attr_reader :client

  def initialize
    @client = Mysql2::Client.new(
      host: ENV['DB_HOST'],
      username: ENV['DB_USERNAME'],
      database: ENV['DB_NAME']
    )
  end
end
