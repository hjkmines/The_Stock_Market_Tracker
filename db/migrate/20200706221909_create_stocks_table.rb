class CreateStocksTable < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :stock 
      t.string :ticker_symbol 
      t.integer :price 
    end 
  end
end
