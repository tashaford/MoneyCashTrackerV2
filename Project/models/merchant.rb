require_relative '../db/sql_runner'

class Merchant

  attr_reader :name, :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO merchants (name) VALUES ('#{@name}') RETURNING * ; "
    merchant = SqlRunner.run(sql)
    @id = merchant[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM merchants ;"
    result = SqlRunner.run(sql)
    return result.map { |hash| Merchant.new(hash) }
  end

  def self.find(id)
    sql="SELECT * FROM merchants WHERE id=#{id} ;"
    results = SqlRunner.run(sql)
    return results.map { |hash| Merchant.new(hash) }.first()
  end

  def update(options)
    sql = "UPDATE merchants SET
    name = '#{options['name']}'
    WHERE id = '#{options['id']}' ;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM merchants WHERE id = #{@id} ;co"
  end

end