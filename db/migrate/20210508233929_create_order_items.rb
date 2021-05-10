class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :buy_price
      t.integer :quantity
      t.integer :is_active,default: 0
      t.timestamp :created_at, default: Time.now
      t.timestamp :updated_at, default: Time.now
    end
  end
end
