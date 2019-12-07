require 'mysql2'
require 'dotenv/load'

client = Mysql2::Client.new(
  host: ENV['DB_HOST'],
  username: ENV['DB_USERNAME'],
  database: ENV['DB_NAME']
)

task :create_table do
  Rake::Task[:create_table_users].execute
  Rake::Task[:create_table_articles].execute
end

task :drop_table do
  Rake::Task[:drop_table_articles].execute
  Rake::Task[:drop_table_users].execute
end

task :create_table_users do |task|
  sql = <<-SQL
    CREATE TABLE users(
      id BIGINT(20) AUTO_INCREMENT NOT NULL,
      name VARCHAR(25) NOT NULL,
      password VARCHAR(255) NOT NULL,
      PRIMARY KEY (id),
      UNIQUE name_index (name)
    )
  SQL

  client.query(sql)

  puts "#{task.name} done!"
end

task :create_table_articles do |task|
  sql = <<-SQL
    CREATE TABLE articles(
      id BIGINT(20) AUTO_INCREMENT NOT NULL,
      user_id BIGINT(20) NOT NULL,
      title VARCHAR(25) NOT NULL,
      description TEXT NOT NULL,
      PRIMARY KEY (id),
      INDEX user_id_index (user_id),
      FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
    )
  SQL

  client.query(sql)

  puts "#{task.name} done!"
end

task :drop_table_users do |task|
  sql = 'DROP TABLE users'

  client.query(sql)

  puts "#{task.name} done!"
end

task :drop_table_articles do |task|
  sql = 'DROP TABLE articles'

  client.query(sql)

  puts "#{task.name} done!"
end
