class CreateShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_addresses do |t|
      t.string :name
      t.string :postal_code
      t.string :address
      t.integer :customer_id
      t.timestamps
    end
  end
end
