
class Tag

  attr_accessor :type
  attr_reader :id

  def initialize(details)
    @id = details["id"].to_i if details["id"]
    @type = details["type"]
  end


end
