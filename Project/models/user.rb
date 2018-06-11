require_relative '../db/sql_runner'

class User

  attr_reader :name, :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO users (name) VALUES ('#{name}') RETURNING * ; "
    user = SqlRunner.run(sql)
    @id = user[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM users ;"
    users = SqlRunner.run(sql)
    result = users.map { |user| User.new(user) }
    return result
  end

end