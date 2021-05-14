class OrderItem < ApplicationRecord
   enum is_active: { 制作不可: 0, 制作待ち: 1, 製作中: 2, 製作完了: 3}
   belongs_to :item
  belongs_to :order
end
