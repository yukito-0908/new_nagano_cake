class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :customer_id
      t.string  :name
      t.string  :postal_code
      t.string :address
      t.timestamp :created_at, default: Time.now
      t.timestamp :updated_at, default: Time.now
    end
  end
end
