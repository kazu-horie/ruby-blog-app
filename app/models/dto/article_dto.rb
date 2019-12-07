module DTO
  class Article
    attr_reader :id, :user_id, :title, :description, :user

    def initialize(id, user_id, title, description, user = nil)
      @id = id
      @user_id = user_id
      @title = title
      @description = description
      @user = user
    end
  end
end
