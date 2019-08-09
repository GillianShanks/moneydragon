class Transaction

  attr_accessor :amount, :merchant_id, :tag_id
  attr_reader :id

  def initialize(details)
    @id = details["id"].to_i if details["id"]
    @amount = details["amount"].to_i
    @merchant_id = details["amount"].to_i
    @tag_id = details["tag"].to_i
  end


end
