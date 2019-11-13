module DAO
  class Article < BaseDAO
    attr_reader :client

    def articles_all
      sql = <<-SQL
        SELECT * FROM articles
      SQL

      results = client.query(sql)

      articles = []
      results.each do |row|
        articles << DTO::Article.new(
          row['id'],
          row['title'],
          row['description']
        )
      end

      articles
    end
  end
end
