class CreatePortfoliosTable < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.references :user, foreign_key: true 
      t.references :stock, foreign_key: true 
      t.string :company
      t.integer :account_number 
      t.integer :account_value 
    end 
  end
end
