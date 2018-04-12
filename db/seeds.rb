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

shoesizes = Shoesize.create([
  {
    region: 'internal',
    sizes: '0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25',
  },
  {
    region: 'EU',
    sizes: '35, 35.5, 36, 36.5, 37, 37.5, 38, 38.5, 39, 40, 41, 42, 43, 43.5, 44, 44.5, 45, 45.5, 46, 46.5, 47, 47.5, 48.5, 49, 50, 51',
  },
  {
    region: 'US',
    sizes: '2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11, 11.5, 12, 12.5, 13, 13.5, 14, 14.5, 15.5, 16.5',
  },
  {
    region: 'UK',
    sizes: '2, 2.3, 3, 3.5, 4, 4.5, 5, 5.5, 6, 7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11, 11.5, 12, 12.5, 13, 13.5, 14, 15, 16',
  },
  {
    region: 'AUS',
    sizes: '2, 2.3, 3, 3.5, 4, 4.5, 5, 5.5, 6, 7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11, 11.5, 12, 12.5, 13, 13.5, 14, 15, 16',
  },
  {
    region: 'MX',
    sizes: '-, -, -, -, -, -, 4.5, 5, 6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11, 11.5, 12, 12.5, 13, 13.5, 14.5, 15.5',
  },
  {
    region: 'JPN',
    sizes: '20, 21, 22, 22.5, 23, 23.5, 24, 24.5, 25.5, 26, 26.5, 27, 27.5, 28, 28.5, 29, 29.5, 30, 30.5, 31, 31.5, 32, 32.5, 33, 34, 35',
  },
  {
    region: 'CHN',
    sizes: '33, 34, 35, 36, 37, 38, 39, 39.5, 41, -, 42, 43, 43.5, 44, 44.5, 45, 46, -, 47, 47.5, 48, -, -, -, -, -',
  },
  {
    region: 'Inch',
    sizes: '8.7", 8.8", 9", 9.1", 9.2", 9.3", 9.5", 9.6", 9.8", 10", 10.1", 10.2", 10.3", 10.5", 10.6", 10.7", 10.8", 11", 11.1", 11.2", 11.3", 11.5", 11.6", 11.7", 12", 12.2"',
  },
  {
    region: 'CM',
    sizes: '22.2, 22.5, 22.8, 23.1, 23.5, 23.8, 24.1, 24.4, 25, 25.4, 25.7, 26, 26.3, 26.6, 26.9, 27.3, 27.6, 28, 28.2, 28.5, 28.9, 29.2, 29.5, 29.8, 30.5, 31.1',
  }
])


stockitems = Stockitem.create([
  {
    stock_type: 'sneaker',
    description: 'Beautiful sneaker',
    sold_status: false,
    public: true,
    original_code: 'NIKE-9879w87987',
    sell_price: 100,
    internal_size: 15,
    usersell_id: users[0].id,
   },
   {
     stock_type: 'sneaker2',
     description: 'More Beautiful sneaker',
     sold_status: false,
     public: true,
     original_code: 'ADIDAS-9asdf0ii87',
     sell_price: 200,
     internal_size: 17,
     usersell_id: users[1].id,
   },
   {
     stock_type: 'Sneaker Top',
     description: 'Top sneaker',
     sold_status: true,
     public: true,
     original_code: 'Puma 098098hh977',
     sell_price: 200,
     internal_size: 13,
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
