class Order < ApplicationRecord
<<<<<<< HEAD

    belongs_to :member

	has_many :order_items, dependent: :destroy
	has_many :items, :through => :order_items


	enum is_payment_method: { クレジットカード: true, 銀行振込: false }
>>>>>>> master

end
