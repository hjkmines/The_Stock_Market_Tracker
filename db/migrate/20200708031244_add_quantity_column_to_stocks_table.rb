class AddQuantityColumnToStocksTable < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :quantity, :integer 
  end
end
