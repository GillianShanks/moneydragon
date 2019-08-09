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

transaction1 = Transaction.new({
  "amount" => 15,
  "merchant_id" => merchant1.id,
  "tag_id" => tag3.id
  })

transaction2 = Transaction.new({
  "amount" => 20,
  "merchant_id" => merchant3.id,
  "tag_id" => tag1.id
  })

transaction3 = Transaction.new({
  "amount" => 40,
  "merchant_id" => merchant2.id,
  "tag_id" => tag2.id
  })
