class Item < ApplicationRecord

    has_many :members, through: :cart_items

	attachment :image
	has_many :cart_items
	has_many :order_items
	belongs_to :genre


	enum is_status: {販売中: false,販売停止中: true}
	validates :name, presence: true
	validates :introduction, length: { maximum: 200 }

end

