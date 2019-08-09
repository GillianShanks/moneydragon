
class Merchant

  attr_accessor :name
  attr_reader :id

  def initialize(details)
    @id = details["id"].to_i if details["id"]
    @name = details["name"]

  end


end
