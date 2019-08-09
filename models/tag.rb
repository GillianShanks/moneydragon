
class Tag

  attr_accessor :type
  attr_reader :id

  def initialize(details)
    @id = details["id"].to_i if details["id"]
    @type = details["type"]
  end

  def save()
    sql = "INSERT INTO tags (type) VALUES ($1) RETURNING id"
    values = [@type]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i()
  end

  def Tag.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end

end
