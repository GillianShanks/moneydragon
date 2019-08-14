require_relative("../models/merchant.rb")
require_relative("../models/tag.rb")
require_relative("../models/transaction.rb")
require_relative("../models/month.rb")
require_relative("../models/budget.rb")
require('pry-byebug')

Tag.delete_all()
Merchant.delete_all()
Month.delete_all()
Budget.delete_all()
Transaction.delete_all()

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
  "position" => 1
  })
month2 = Month.new({
  "name" => "February",
  "position" => 2
  })
month3 = Month.new({
  "name" => "March",
  "position" => 3
  })
month4 = Month.new({
  "name" => "April",
  "position" => 4
  })
month5 = Month.new({
  "name" => "May",
  "position" => 5
  })
month6 = Month.new({
  "name" => "June",
  "position" => 6
  })
month7 = Month.new({
  "name" => "July",
  "position" => 7
  })
month8 = Month.new({
  "name" => "August",
  "position" => 8
  })
month9 = Month.new({
  "name" => "September",
  "position" => 9
  })
month10 = Month.new({
  "name" => "October",
  "position" => 10
  })
month11 = Month.new({
  "name" => "November",
  "position" => 11
  })
month12 = Month.new({
  "name" => "December",
  "position" => 12
  })
month1.save()
month2.save()
month3.save()
month4.save()
month5.save()
month6.save()
month7.save()
month8.save()
month9.save()
month10.save()
month11.save()
month12.save()


budget1 = Budget.new({
  "name" => "2018",
  "total"=>733,
  })

budget1.save()

transaction1 = Transaction.new({
  "amount" => 15,
  "merchant_id" => merchant1.id,
  "tag_id" => tag3.id,
  "month_id" => month1.id,
  "budget_id" => budget1.id
  })
transaction1.save()

transaction2 = Transaction.new({
  "amount" => 20,
  "merchant_id" => merchant3.id,
  "tag_id" => tag1.id,
  "month_id" => month10.id,
  "budget_id" => budget1.id
  })
transaction2.save()

transaction3 = Transaction.new({
  "amount" => 40,
  "merchant_id" => merchant2.id,
  "tag_id" => tag2.id,
  "month_id" => month5.id,
  "budget_id" => budget1.id
  })
transaction3.save()

binding.pry
nil
