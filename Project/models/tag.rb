require_relative '../db/sql_runner'

class Tag

  attr_reader :name, :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO tags (name) VALUES ('#{@name}') RETURNING * ; "
    tag = SqlRunner.run(sql)
    @id = tag[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM tags ;"
    result = SqlRunner.run(sql)
    return result.map { |hash| Tag.new(hash) }
  end

  def self.find(id)
    sql = "SELECT * FROM tags where id=#{id} ;"
    results = SqlRunner.run(sql)
    return results.map { |hash| Tag.new(hash) }.first()
  end

  def update(options)
    sql = "UPDATE tags SET
    name = '#{options['name']}'
    where id = '#{options['id']}' ;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM tags WHERE id = #{@id} ;"
    SqlRunner.run(sql)
  end

  def amount_tag
      sql = "SELECT SUM(amount) FROM transactions WHERE tag_id = #{@id};"
      result = SqlRunner.run(sql)[0]["sum"]
      if result == nil
        return 0
      else
        return '%.2f'% result.to_f()
      end
  end

end