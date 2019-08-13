class Budget

  attr_reader :id, :monthly
  attr_accessor :total
  def initialize(details)
    @id = details["id"].to_i() if details["id"]
    @total = details["total"].to_i()
    @monthly = @total/12
  end


end
