module DAO
  class Article < BaseDAO
    attr_reader :client

    def articles_all
      statement = %(
        SELECT * FROM articles
      )

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

    def article_by_id(id)
      statement = client.prepare(%(
        SELECT * FROM articles
        WHERE id = ?
      ))

      result = statement.execute(id).first

      article = DTO::Article.new(
        result['id'],
        result['title'],
        result['description']
      )

      article
    end

    def destroy(id)
      statement = client.prepare(%(
        DELETE FROM articles
        WHERE id = ?
      ))

      statement.execute(id)
    end

    def create(title, description)
      statement = client.prepare(%(
        INSERT INTO articles(title, description)
        VALUES(?, ?)
      ))

      statement.execute(title, description)
    end

    def update(id, title, description)
      puts id
      puts title
      puts description
      statement = client.prepare(%(
        UPDATE articles
        SET title = ?, description = ?
        WHERE id = ?
      ))

      statement.execute(title, description, id)
    end
  end
end
