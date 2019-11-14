module DAO
  class Article < BaseDAO
    attr_reader :client

    def articles_all
      statement = <<-SQL
        SELECT * FROM articles
      SQL

      results = client.query(statement)

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

    def delete(id)
      statement = client.prepare('DELETE FROM articles WHERE id = ?')

      statement.execute(id)
    end
  end
end
