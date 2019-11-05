# MoneyDragon

## Helping you hoard your money!
MoneyDragon is a spending tracker app created in Ruby and PSQL. You can view all of your recorded spendings (there are pre-set spendings present when you run the seeds below). You can add new spends/budgets/merchants/tags, view each individually and delete them from the lists. The Spending list has a sorting function too. Enjoy!

### How to run project:

#### In terminal from project folder:
`createdb moneydragon`

`psql -d moneydragon -f db/moneydragon.sql`

`ruby db/seeds.rb`

`ruby controller.rb`

## To view go to: `http://localhost:4567/`
