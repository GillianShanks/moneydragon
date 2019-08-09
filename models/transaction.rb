class Transaction

  attr_accessor :amount, :merchant_id, :tag_id
  attr_reader :id

  def initialize(details)
    @id = details["id"].to_i if details["id"]
    @amount = details["amount"].to_i
    @merchant_id = details["merchant_id"].to_i
    @tag_id = details["tag_id"].to_i
  end

  def save()
    sql = "INSERT INTO transactions (amount, merchant_id, tag_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@amount, @merchant_id, @tag_id]
    @id = SqlRunner.run(sql,values)[0]["id"].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

end
