module DTO
  class Article
    attr_reader :id, :title, :description

    def initialize(id, title, description)
      @id = id
      @title = title
      @description = description
    end
  end
end
