class Order < ApplicationRecord
	belongs_to :customer
	has_many   :order_items, dependent: :destroy
	has_many :items, :through => :order_items


	enum is_payment_method: { クレジットカード: true, 銀行振込: false }

end
