class Genre < ApplicationRecord

 has_many :items

 enum is_status: { 有効: false, 無効: true }

 validates :name, presence: true

end

