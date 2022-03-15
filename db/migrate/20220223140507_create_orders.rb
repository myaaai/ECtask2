class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.timestamps
      t.integer :customer_id
      t.integer :postal_code
      t.string :name
      t.string :shipping_address
      t.integer :postage
      t.integer :amount_claimed
      t.integer :method_payment
      t.string :order_statuses
      
    end
  end
end
