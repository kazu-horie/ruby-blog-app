module DTO
  class User
    include BCrypt

    attr_reader :id, :name

    def initialize(id, name, password, articles = [])
      @id = id
      @name = name
      @password = password
      @articles = articles
    end

    def password
      Password.new(@password)
    end
  end
end
