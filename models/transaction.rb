class Transaction

  attr_accessor :amount, :merchant_id, :tag_id, :month_id
  attr_reader :id

  def initialize(details)
    @id = details["id"].to_i if details["id"]
    @amount = details["amount"].to_i
    @merchant_id = details["merchant_id"].to_i
    @tag_id = details["tag_id"].to_i
    @month_id = details["month_id"].to_i
  end

  def save()
    sql = "INSERT INTO transactions (amount, merchant_id, tag_id, month_id) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@amount, @merchant_id, @tag_id, @month_id]
    @id = SqlRunner.run(sql,values)[0]["id"].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE transactions SET (amount, merchant_id, tag_id, month_id) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@amount, @merchant_id, @tag_id, @month_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    transactions = SqlRunner.run(sql)
    return transactions.map{|details|Transaction.new(details)}
  end

  def delete()
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    transaction=SqlRunner.run(sql,values)[0]
    return Transaction.new(transaction)
  end

  def merchant()
    sql = "SELECT * FROM merchants WHERE id = $1"
    values=[@merchant_id]
    merchant = SqlRunner.run(sql,values)[0]
    return Merchant.new(merchant)
  end

  def tag()
    sql = "SELECT * FROM tags WHERE id = $1"
    values =[@tag_id]
    tag= SqlRunner.run(sql,values)[0]
    return Tag.new(tag)
  end

  # def month()
  #
  # end

  def self.total()
    sql="SELECT SUM(amount) FROM transactions"
    return SqlRunner.run(sql)[0]["sum"].to_i()
  end

end
