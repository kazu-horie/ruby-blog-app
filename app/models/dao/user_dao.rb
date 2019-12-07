module DAO
  class User < BaseDAO
    include BCrypt

    attr_reader :client

    def user_by_name(name)
      statement = client.prepare(%(
        SELECT * FROM users
        WHERE name = ?
      ))

      result = statement.execute(name).first

      return unless result

      user = DTO::User.new(
        result['id'],
        result['name'],
        result['password']
      )

      user
    end

    def users
      statement = client.prepare('SELECT * FROM users')

      results = statement.execute

      users = []
      results.each do |row|
        users << DTO::User.new(
          row['id'],
          row['name'],
          row['password']
        )
      end

      users
    end

    def create(name, password)
      statement = client.prepare(%(
        INSERT INTO users(name, password)
        VALUES(?, ?)
      ))

      statement.execute(name, Password.create(password))
    end
  end
end
