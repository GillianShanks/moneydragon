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

  def Merchant.all()
    sql = "SELECT * FROM merchants"
    merchants = SqlRunner.run(sql)
    return merchants.map{|merchant| Merchant.new(merchant)}
  end

  def delete()
    sql = "DELETE FROM merchants where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = $1"
    values =[id]
    merchant = SqlRunner.run(sql, values)[0]
    return Merchant.new(merchant)
  end

  def transactions()
    sql="SELECT * FROM transactions WHERE merchant_id = $1"
    values=[@id]
    transactions=SqlRunner.run(sql,values)
    return transactions.map{|details| Transaction.new(details)}

  end

  def total()
    return transactions().sum{|spend|spend.amount}
  end

end
