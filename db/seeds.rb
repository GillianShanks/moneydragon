require_relative("../models/merchant.rb")
require_relative("../models/tag.rb")
require_relative("../models/transaction.rb")

merchant1 = Merchant.new({
  "name" => "Amazon"
  })

merchant2 = Merchant.new({
  "name" => "Asda"
  })

merchant3 = Merchant.new({
  "name" => "Cineworld"
  })

tag1 = Tag.new({
  "type" => "entertainment"
  })

tag2 = Tag.new({
  "type" => "food"
  })

tag3 = Tag.new({
  "type" => "games"
  })
