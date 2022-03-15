class CreateOrderedItems < ActiveRecord::Migration[6.1]
  def change
    create_table :ordered_items do |t|
      t.integer :item_id
      t.integer :customer_id
      t.integer :amount
      t.string :production_status
      t.integer :tax_price
      t.integer :order_id

      t.timestamps
    end
  end
end
