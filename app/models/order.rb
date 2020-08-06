class Order < ApplicationRecord

	belongs_to :member
    enum order_status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済:4}

	has_many   :order_items, dependent: :destroy

	has_many :items, :through => :order_items

	enum is_payment_method: { クレジットカード: true, 銀行振込: false }

end
