# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p "seeds started"

Order.destroy_all
Bid.destroy_all
Stockitem.destroy_all
User.destroy_all

users = User.create([
  {
    email: 'test@test.com',
    first_name: 'John',
    last_name: 'Doe',
  },
  {
    email: 'test2@test.com',
    first_name: 'Henk',
    last_name: 'Habraken',
  },
  {
    email: 'test3@test.com',
    first_name: 'Piet',
    last_name: 'Jansen',
  },
  {
    email: 'test4@test.com',
    first_name: 'Jan',
    last_name: 'Pietersen',
  }
])

stockitems = Stockitem.create([
  {
    stock_type: 'sneaker',
    description: 'Beautiful sneaker',
    sold_status: false,
    original_code: 'NIKE-9879w87987',
    sell_price: 100,
    usersell_id: users[0].id,
   },
   {
     stock_type: 'sneaker2',
     description: 'More Beautiful sneaker',
     sold_status: false,
     original_code: 'ADIDAS-9asdf0ii87',
     sell_price: 200,
     usersell_id: users[1].id,
   },
   {
     stock_type: 'Sneaker Top',
     description: 'Top sneaker',
     sold_status: true,
     original_code: 'Puma 098098hh977',
     sell_price: 200,
     usersell_id: users[1].id,
   }
])
  
bids = Bid.create([
  {
    bid_price: 25,
    userbuy_id: users[2].id,
    stockitem: stockitems[0],
  },
  {
    bid_price: 15,
    userbuy_id: users[3].id,
    stockitem: stockitems[0],
  },
  {
    bid_price: 25,
    userbuy_id: users[1].id,
    stockitem: stockitems[1],
  },
  {
    bid_price: 15,
    userbuy_id: users[0].id,
    stockitem: stockitems[1],
  }
])

orders = Order.create([
  {
    order_price: 200,
    bid: bids[0],
    stockitem: stockitems[2],
    order_time: "2018-03-02"
  }
])


p "seeds done"