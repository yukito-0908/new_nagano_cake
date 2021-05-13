class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  acts_as_paranoid

  def active_for_authentication?
    super && (self.is_active == true)
  end


  def full_name
    def full_name
      self.first_name + self.last_name
    end
  end
end
