class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string  :delivery_postal_code
      t.string :delivery_name
      t.string :delibery_address
      t.integer :shopping
      t.integer :billing_amount
      t.integer :method_of_payment,default: 0
      t.integer :is_active,default: 0
      t.timestamp :created_at, default: Time.now
      t.timestamp :updated_at, default: Time.now
    end
  end
end
