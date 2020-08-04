class Item < ApplicationRecord

   has_many :members, through: :cart_items
   has_many :cart_items
   has_many :order_items
   belongs_to :genre




end
