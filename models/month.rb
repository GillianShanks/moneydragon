class Month

  attr_reader :id, :name, :order
  def initialize(details)
    @id = details["id"].to_i() if details["id"]
    @name = details["name"]
    @order = details["order"].to_i()
  end

  

end
