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

  


end