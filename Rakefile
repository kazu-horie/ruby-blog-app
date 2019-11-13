require 'mysql2'

client = Mysql2::Client.new(
  host: 'localhost',
  username: 'root',
  database: 'ruby_blog_app'
)

task :create_table do
  sql = <<-SQL
    CREATE TABLE articles(
      id INT(11) AUTO_INCREMENT NOT NULL,
      title VARCHAR(25) NOT NULL,
      description VARCHAR(255) NOT NULL,
      PRIMARY KEY (id)
    )
  SQL

  client.query(sql)

  puts 'done!'
end
