class Cli 

  def welcome 
    puts "Welcome, do you have a brokerage account? Enter (Y/N)"
    input = gets.strip 
    navigation(input)
  end  

  def navigation(arg)
    if arg == "Y" || arg == "y"
      puts "Great! What is the name of the brokerage company?"
      user_broker = gets.strip  
      puts "What is your first and last name?"
      $user_name = gets.strip
      puts "What is your account number?"
      user_account_number = gets.strip  
      options($user_name) 
    elsif arg == "N" || arg == "n"
      puts "Let's make a new account for you"
      puts "What is your first and last name?"
      $user_name = gets.strip 
      puts "What is your age?"
      user_age = gets.strip.to_i 
      puts "What brokerage would you like to open your account with? (Enter the number for the desired action, e.g. '1')"
      brokerage_options = ["1. Vanguard", "2. Fidelity", "3. E*trade", "4. TD Ameritrade"]
      puts brokerage_options
      $user_brokerage = gets.strip 
      $random_account_generator = rand(100000..999999)
      $new_user = User.create(name: $user_name, age: user_age)
      $new_stock = Stock.create(stock: Stock.stock_generator[0], ticker_symbol: Stock.stock_generator[1], price: Stock.stock_generator[2], quantity: 1)
      Portfolio.create(user_id: $new_user.id, stock_id: $new_stock.id, company: $user_brokerage, account_number: $random_account_generator, account_value: $new_stock.price)
      puts ""
      puts "Congrats #{$user_name}! Your new account number is #{$random_account_generator}. You have also been granted a free stock of #{$new_stock.stock} at a value of $#{$new_stock.price}!"
      options($user_name)
    else 
      puts "Invalid input, please try again"
      welcome
    end
  end 

  def options(arg)
    puts ""
    puts "Welcome, #{arg}! What would you like to do today? (Enter the number for the desired action, e.g. '1')"
    options = ["1. Check portfolio balance", "2. Portfolio holdings", "3. Buy stocks", "4. Sell stocks", "5. Research Stocks", "6. Show me 10 random stocks!"]
    puts options 
    user_choice = gets.strip.to_i 
    choices(user_choice) 
  end
  
  def alt_options
    puts "What would you like to do today? (Enter the number for the desired action, e.g. '1')"
    options = ["1. Check portfolio balance", "2. Portfolio holdings", "3. Buy stocks", "4. Sell stocks", "5. Search a stock", "6. Show me 10 random stocks!"]
    puts options 
    user_choice = gets.strip.to_i 
    choices(user_choice) 
  end
  
  def choices(arg)
    if arg == 1 
      puts "Enter your account number"
      account_num = gets.strip.to_i 
      puts ""
      puts "Your account value is: $#{Portfolio.find_by(account_number: account_num).account_value}"
      return_to_menu
    elsif arg == 2
      # puts "Enter your account number"
      # account_num = gets.strip.to_i
      puts $new_user.stocks
      return_to_menu
    elsif arg == 3 
      puts "What stock do you want to look for? Enter stock symbol in ALL CAPS"
      user_stock = gets.strip.to_s
      Stock.buy_and_sell_stock(user_stock)
      puts "How many do you want to buy?"
      quantity = gets.strip.to_i
      puts "Do you confirm your purchase of #{quantity} shares of #{user_stock}? Enter (Y/N)"
      decision = gets.strip
        if decision == "Y" || decision == "y"
          buy_stock = Stock.create(stock: Stock.buy_and_sell_stock(user_stock)[0], ticker_symbol: Stock.buy_and_sell_stock(user_stock)[1], price: Stock.buy_and_sell_stock(user_stock)[2], quantity: quantity)
          Portfolio.create(user_id: $new_user.id, stock_id: buy_stock.id, company: $user_brokerage, account_number: $random_account_generator, account_value: (buy_stock.price * buy_stock.quantity))
          puts "Congrats! You just purchased #{quantity} shares of #{user_stock}!"
          return_to_menu
        else 
          return_to_menu
        end  
    elsif arg == 4 
      puts "What stock do you want to sell in your portfolio?"
      user_stock = gets.strip.to_s 
      puts "How many do you want to sell?"
      quantity = gets.strip.to_i 
      puts "Do you confirm your sell of #{quantity} shares of #{user_stock}? Enter (Y/N)"
      decision = gets.strip
        if decision == "Y" || decision == "y"
          puts "Congrats! You just sold #{quantity} shares of #{user_stock}!"
          return_to_menu
        else 
          return_to_menu
        end 
    elsif arg == 5 
      puts "What stock do you want to look for? Enter stock symbol in ALL CAPS"
      user_stock = gets.strip.to_s
      Stock.search_stock(user_stock)
      return_to_menu
    elsif arg == 6 
      Stock.random_10_stocks
      return_to_menu
    end 
  end 

  def return_to_menu 
    puts "Return to main menu? Enter (Y/N)"
    user_input = gets.strip 
      if user_input == "Y" || user_input == "y"
        alt_options
      else 
        exit
      end 
  end 
end 