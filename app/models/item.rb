class Item < ApplicationRecord
	attachment :image
	has_many :cart_items
	has_many :order_items
	belongs_to :genre

	validates :is_status,
	inclusion: { in: [true, false] }
	validates :name, presence: true
	validates :introduction, length: { maximum: 200 }
end

