class Order < ApplicationRecord
  enum method_of_payment: { A: 0, B: 1 }
  enum is_active: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}
  belongs_to :customer
  has_many :order_items, dependent: :destroy
end
