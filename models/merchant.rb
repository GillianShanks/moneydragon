require_relative("../db/sql_runner.rb")

class Merchant

  attr_accessor :name
  attr_reader :id

  def initialize(details)
    @id = details["id"].to_i if details["id"]
    @name = details["name"]
  end

  def save()
    sql = "INSERT INTO merchants (name) VALUES ($1) RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i()
  end

  def Merchant.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE merchants SET name = $1 where id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

end
