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
Usersell.destroy_all
Userbuy.destroy_all

usersells = Usersell.create([
  {
    email: 'test@test.com',
    first_name: 'John',
    last_name: 'Doe',
  },
  {
    email: 'test2@test.com',
    first_name: 'Henk',
    last_name: 'Habraken',
  }
])

userbuys = Userbuy.create([
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
    usersell: usersells[0],
  },
  {
    stock_type: 'sneaker2',
    description: 'More Beautiful sneaker',
    sold_status: false,
    original_code: 'ADIDAS-9asdf0ii87',
    sell_price: 200,
    usersell: usersells[1],
  },
  {
    stock_type: 'Sneaker Top',
    description: 'Top sneaker',
    sold_status: true,
    original_code: 'Puma 098098hh977',
    sell_price: 200,
    usersell: usersells[1],
  }
])

bids = Bid.create([
  {
    bid_price: 25,
    userbuy: userbuys[0],
    stockitem: stockitems[0],
  },
  {
    bid_price: 15,
    userbuy: userbuys[1],
    stockitem: stockitems[0],
  },
  {
    bid_price: 25,
    userbuy: userbuys[1],
    stockitem: stockitems[1],
  },
  {
    bid_price: 15,
    userbuy: userbuys[1],
    stockitem: stockitems[1],
  }
])

orders = Order.create([
  {
    order_price: 200,
    userbuy: userbuys[1],
    usersell: usersells[0],
    stockitem: stockitems[2],
    order_time: "2018-03-02"
  }
])


p "seeds done"