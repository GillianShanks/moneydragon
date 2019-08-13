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

end
