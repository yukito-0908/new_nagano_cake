class Order < ApplicationRecord
  enum method_of_payment: { A: 0, B: 1 }
  belongs_to :customer
  has_many :order_items, dependent: :destroy
end
