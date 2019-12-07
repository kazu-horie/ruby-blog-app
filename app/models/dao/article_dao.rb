module DAO
  class Article < BaseDAO
    include BCrypt

    attr_reader :client

    def articles_with_user
      statement = %(
        SELECT *, articles.id as article_id
        FROM articles
        INNER JOIN users
        ON articles.user_id = users.id
      )

      results = client.query(statement)

      articles = []
      results.each do |row|
        articles << DTO::Article.new(
          row['article_id'],
          row['user_id'],
          row['title'],
          row['description'],
          DTO::User.new(
            row['user_id'],
            row['name'],
            row['password']
          )
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
        result['user_id'],
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

    def create(user_id, title, description)
      statement = client.prepare(%(
        INSERT INTO articles(user_id, title, description)
        VALUES(?, ?, ?)
      ))

      statement.execute(user_id, title, description)
    end

    def update(id, title, description)
      statement = client.prepare(%(
        UPDATE articles
        SET title = ?, description = ?
        WHERE id = ?
      ))

      statement.execute(title, description, id)
    end
  end
end
