require_relative("../models/merchant.rb")
require_relative("../models/tag.rb")
require_relative("../models/transaction.rb")
require('pry-byebug')

Tag.delete_all()
Merchant.delete_all()

merchant1 = Merchant.new({
  "name" => "Amazon"
  })

merchant1.save()

merchant2 = Merchant.new({
  "name" => "Asda"
  })

merchant2.save()

merchant3 = Merchant.new({
  "name" => "Cineworld"
  })

merchant3.save()



tag1 = Tag.new({
  "type" => "entertainment"
  })

tag1.save()

tag2 = Tag.new({
  "type" => "food"
  })

tag2.save()

tag3 = Tag.new({
  "type" => "games"
  })

tag3.save()

month1 = Month.new({
  "name" => "January",
  "order" => 1
  })
month2 = Month.new({
  "name" => "February",
  "order" => 2
  })
month3 = Month.new({
  "name" => "March",
  "order" => 3
  })
month4 = Month.new({
  "name" => "April",
  "order" => 4
  })
month5 = Month.new({
  "name" => "May",
  "order" => 5
  })
month6 = Month.new({
  "name" => "June",
  "order" => 6
  })
month7 = Month.new({
  "name" => "July",
  "order" => 7
  })
month8 = Month.new({
  "name" => "August",
  "order" => 2
  })
month9 = Month.new({
  "name" => "September",
  "order" => 2
  })
month10 = Month.new({
  "name" => "October",
  "order" => 2
  })
month11 = Month.new({
  "name" => "November",
  "order" => 2
  })
month12 = Month.new({
  "name" => "December",
  "order" => 2
  })



transaction1 = Transaction.new({
  "amount" => 15,
  "merchant_id" => merchant1.id,
  "tag_id" => tag3.id
  })
transaction1.save()

transaction2 = Transaction.new({
  "amount" => 20,
  "merchant_id" => merchant3.id,
  "tag_id" => tag1.id
  })
transaction2.save()

transaction3 = Transaction.new({
  "amount" => 40,
  "merchant_id" => merchant2.id,
  "tag_id" => tag2.id
  })
transaction3.save()

binding.pry
nil
