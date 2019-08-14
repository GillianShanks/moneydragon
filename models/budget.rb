require_relative('../db/sql_runner.rb')

class Budget

  attr_reader :id, :monthly
  attr_accessor :total, :name
  def initialize(details)
    @id = details["id"].to_i() if details["id"]
    @name = details["name"]
    @total = details["total"].to_i()
    @monthly = '%.2f' % (@total.to_f()/12)

  end


  def save()
    sql="INSERT INTO budgets (name, total, monthly) VALUES ($1, $2, $3) RETURNING id"
    values =[@name, @total, @monthly]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i()
  end

  def self.delete_all()
    sql="DELETE FROM budgets"
    SqlRunner.run(sql)
  end

  def update()
    sql="UPDATE budgets SET (name, total, monthly) = ($1, $2, $3) WHERE id = $4"
    values=[@name, @total, @months, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql="SELECT * FROM budgets"
    budgets=SqlRunner.run(sql)
    return budgets.map{|budget|Budget.new(budget)}
  end

  def delete()
    sql="DELETE FROM budgets WHERE id = $1"
    values=[@id]
    SqlRunner.run(sql,values)
  end

  def self.find(id)
    sql="SELECT * FROM budgets WHERE id = $1"
    values = [id]
    budget = SqlRunner.run(sql, values)[0]
    return Budget.new(budget)
  end

  def transactions()
    sql="SELECT * FROM transactions WHERE budget_id = $1"
    values=[@id]
    transactions = SqlRunner.run(sql,values)
    return transactions.map{|details| Transaction.new(details)}
  end

  def total_spent()
    return transactions().sum{|spend|spend.amount}
  end

  def remaining()
    return @total - total_spent()
  end

  def warning()
    return " !!!! OH NO! Budget limit has been EXCEEDED !!!!!" if remaining()<0
    return " !!! WARNING: near budget limit !!!" if remaining()<10

  end

end
