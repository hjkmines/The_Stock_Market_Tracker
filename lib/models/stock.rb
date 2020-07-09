class Stock < ActiveRecord::Base 
  has_many :portfolios 
  has_many :users, through: :portfolios
  
  def self.stock_generator 
    #api data for company stock symbols 
    key = ENV["API_KEY"]
    stock_symbols = RestClient.get "https://finnhub.io/api/v1/stock/symbol?exchange=US&token=#{key}"
    #parsed data for stock symbols 
    parsed_stock_symbols = JSON.parse(stock_symbols)
    #outputs company name like ["American Airlines", "Google", "etc"]
    description = parsed_stock_symbols.map do |stock|
      stock["description"]
    end.compact 
    #outputs company symbol like ["AAL", "GOOGL", "etc"]
    symbols = parsed_stock_symbols.map do |stock|
      stock["symbol"]
    end.compact 
    #reorganizes array with company and its symbol like [["American Airlines", "AAL"], ["Google", "GOOGL"]]
    stocks_with_symbols = description.zip(symbols)
    #selects random stock from the variable above 
    random_stock = stocks_with_symbols.sample 
    #fetches realtime quote of target company 
    quote = RestClient.get "https://finnhub.io/api/v1/quote?symbol=#{random_stock[1]}&token=#{key}"
    parsed_quotes = JSON.parse(quote)
    stock_and_current_price = random_stock.push("$" + "#{parsed_quotes["c"]}")
    end 

    def self.random_10_stocks 
      p ("Time that the data was pulled:" + " #{Time.now}")
      10.times {p(Stock.stock_generator)}
    end 

    def self.search_stock(symbol)
      stock_symbols = RestClient.get "https://finnhub.io/api/v1/stock/symbol?exchange=US&token=#{key}"
      #parsed data for stock symbols 
      parsed_stock_symbols = JSON.parse(stock_symbols)
      #outputs company name like ["American Airlines", "Google", "etc"]
      description = parsed_stock_symbols.map do |stock|
        stock["description"]
      end.compact 
      #outputs company symbol like ["AAL", "GOOGL", "etc"]
      symbols = parsed_stock_symbols.map do |stock|
        stock["symbol"]
      end.compact 
      #reorganizes array with company and its symbol like [["American Airlines", "AAL"], ["Google", "GOOGL"]]
      stocks_with_symbols = description.zip(symbols)

      selected_stock = stocks_with_symbols.map {|stock| stock[1] == symbol ? stock : nil}.compact.flatten
      #fetches realtime quote of target company 
      quote = RestClient.get "https://finnhub.io/api/v1/quote?symbol=#{selected_stock[1]}&token=#{key}"
      parsed_quotes = JSON.parse(quote)
      p selected_stock
      p parsed_quotes
    end 

end 


