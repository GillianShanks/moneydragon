require_relative('../db/sql_runner.rb')

class Tag

  attr_accessor :type
  attr_reader :id

  def initialize(details)
    @id = details["id"].to_i if details["id"]
    @type = details["type"]
  end

  def save()
    sql = "INSERT INTO tags (type) VALUES ($1) RETURNING id"
    values = [@type]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i()
  end

  def Tag.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE tags SET type = $1 WHERE id = $2"
    values = [@type, @id]
    SqlRunner.run(sql,values)
  end

  def Tag.all()
    sql = "SELECT * FROM tags"
    tags = SqlRunner.run(sql)
    return tags.map{|tag| Tag.new(tag)}
  end

  def delete()
    sql = "DELETE FROM tags WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def Tag.find(id)
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [id]
    tag = SqlRunner.run(sql, values)[0]
    return Tag.new(tag)
  end

  def transactions()
    sql="SELECT * FROM transactions WHERE tag_id = $1"
    values = [@id]
    transactions = SqlRunner.run(sql, values)
    return transactions.map{|details| Transaction.new(details)}
  end

  def total()
    return transactions().sum{|spend|spend.amount}
  end

end
