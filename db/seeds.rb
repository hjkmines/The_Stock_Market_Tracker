Portfolio.destroy_all
Stock.destroy_all 
User.destroy_all 

# #existing users 
# user1 = User.create(name: "Tony Kim", age: rand(18..125))
# user2 = User.create(name: "John Santos", age: rand(18..125))
# user3 = User.create(name: "Paul Mer", age: rand(18..125))
# user4 = User.create(name: "Pedro San", age: rand(18..125))
# user5 = User.create(name: "Johnny Sims", age: rand(18..125))


# # stocks 
# stock1 = Stock.create(stock: Stock.stock_generator[0], ticker_symbol: Stock.stock_generator[1], price: Stock.stock_generator[2])
# stock2 = Stock.create(stock: Stock.stock_generator[0], ticker_symbol: Stock.stock_generator[1], price: Stock.stock_generator[2])
# stock3 = Stock.create(stock: Stock.stock_generator[0], ticker_symbol: Stock.stock_generator[1], price: Stock.stock_generator[2])
# stock4 = Stock.create(stock: Stock.stock_generator[0], ticker_symbol: Stock.stock_generator[1], price: Stock.stock_generator[2])
# stock5 = Stock.create(stock: Stock.stock_generator[0], ticker_symbol: Stock.stock_generator[1], price: Stock.stock_generator[2])
# stock6 = Stock.create(stock: Stock.stock_generator[0], ticker_symbol: Stock.stock_generator[1], price: Stock.stock_generator[2])
# stock7 = Stock.create(stock: Stock.stock_generator[0], ticker_symbol: Stock.stock_generator[1], price: Stock.stock_generator[2])
# stock8 = Stock.create(stock: Stock.stock_generator[0], ticker_symbol: Stock.stock_generator[1], price: Stock.stock_generator[2])


# # #portfolios
# Portfolio.create(user_id: user1.id, stock_id: stock1.id, company: "Vanguard", account_number: rand(100000..999999), account_value: rand(100000..9999999))
# Portfolio.create(user_id: user1.id, stock_id: stock5.id, company: "Vanguard", account_number: rand(100000..999999), account_value: rand(100000..9999999))
# Portfolio.create(user_id: user1.id, stock_id: stock2.id, company: "Fidelity", account_number: rand(100000..999999), account_value: rand(100000..9999999))
# Portfolio.create(user_id: user3.id, stock_id: stock3.id, company: "Fidelity", account_number: rand(100000..999999), account_value: rand(100000..9999999))
# Portfolio.create(user_id: user4.id, stock_id: stock6.id, company: "E*trade", account_number: rand(100000..999999), account_value: rand(100000..9999999))
# Portfolio.create(user_id: user5.id, stock_id: stock2.id, company: "E*trade", account_number: rand(100000..999999), account_value: rand(100000..9999999))
# Portfolio.create(user_id: user3.id, stock_id: stock1.id, company: "TD Ameritrade", account_number: rand(100000..999999), account_value: rand(100000..9999999))






