require_relative('../db/sql_runner.rb')

class Month

  attr_reader :id, :name, :position
  def initialize(details)
    @id = details["id"].to_i() if details["id"]
    @name = details["name"]
    @position = details["position"].to_i()
  end

  def save()
    sql="INSERT INTO months (name, position) VALUES ($1,$2) RETURNING id"
    values=[@name, @position]
    @id=SqlRunner.run(sql, values)[0]["id"].to_i()
  end

  def self.delete_all()
    sql="DELETE FROM months"
    SqlRunner.run(sql)
  end

  def self.all()
    sql="SELECT * FROM months ORDER BY position"
    months=SqlRunner.run(sql)
    return months.map{|month|Month.new(month)}
  end

  def self.find(id)
    sql="SELECT * FROM months WHERE id = $1"
    values=[id]
    month=SqlRunner.run(sql, values)[0]
    return Month.new(month)
  end

  def transactions()
    sql="SELECT * FROM transactions WHERE month_id = $1"
    values=[@id]
    transactions=SqlRunner.run(sql, values)
    return transactions.map{|transaction|Transaction.new(transaction)}
  end

  def total()
    return transactions().sum{|transaction|transaction.amount}

  end

end
