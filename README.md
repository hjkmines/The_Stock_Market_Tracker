# Stock Martket Command Line Application 
> Your one stop application for stock market analysis!

## Table of Contents 
* [General Info](#general-info)
* [Intro Video](#intro-video)
* [Technologies](#technologies)
* [Code Examples](#code-examples)
* [Features](#features)
* [Status](#status)
* [Inspiration](#inspiration)
* [Contact](#contact)
* [License](#license)

## General Info 
This stock market command line application allow users to own a brokerage account, buy/sell stocks, and research any stocks! New users will be also awarded one free random stock!!

## Intro Video 

## Technologies
* Ruby - version 2.6.1
* ActiveRecord - version 6.0
* Sinatra - version 2.0
* Sinatra-activerecord - version 2.0
* SQLite3 - version 1.4
* Rest-Client - version 2.1
* JSON - version 2.3

## Setup 
To try out this project: 
1. Open a account with https://finnhub.io/
1. Clone the GitHub repository locally to your computer
1. In the command line, navigate to the root directory of this repository, and enter the following: 
  $ touch .env 
1. Navigate to the .env folder, and paste in the following: 
  export API_KEY=YOUR_API_KEY_HERE (e.g. export API_KEY=15151515)
1. Now save all files, on Windows: (start + alt + s), on Macs: (command + alt +s)
1. Run the following code in the command line while being in the most root folder of this project: 
```ruby
ruby runner.rb
```
## Code Examples
```ruby
def self.stock_generator 
    key = ENV["API_KEY"]
    stock_symbols = RestClient.get "https://finnhub.io/api/v1/stock/symbol?exchange=US&token=#{key}"
    parsed_stock_symbols = JSON.parse(stock_symbols)
    quote = RestClient.get "https://finnhub.io/api/v1/quote?symbol=#{random_stock[1]}&token=#{key}"
    parsed_quotes = JSON.parse(quote)

    description = parsed_stock_symbols.map do |stock|
      stock["description"]
    end.compact 

    symbols = parsed_stock_symbols.map do |stock|
      stock["symbol"]
    end.compact 

    stocks_with_symbols = description.zip(symbols)
    random_stock = stocks_with_symbols.sample 
    stock_and_current_price = random_stock.push(parsed_quotes["c"].to_i)
end 
```

```ruby
def self.random_10_stocks 
      p ("Time that the data was pulled:" + " #{Time.now}")
      10.times {p(Stock.stock_generator)}
end 
```

## Features
* Create a brokerage account with various stock trading accounts 
* Check portfolio balance
* Check porfolio holdings 
* Buy and sell stocks in the US Market 
* Research stocks 
* View 10 random stocks for today!

## Status
Project is: finished, has the option to add additional features for the user and ability to refactoring. 

## Inspiration
The inspiration for this applicaiton came from my passion and interest in the stock market. Utilizing a open-source Finnhub Stock API, all types of users have the ability to research stocks in this easy to use application!

## Contact
Created by [Tony Kim](https://www.linkedin.com/in/hyung-kim/)

Feel free to contact me with any questions or inquires about this project!
E-mail: hjkmines@gmail.com
[Click to view](https://github.com/hjkmines/stock_market_application/blob/master/LICENSE)