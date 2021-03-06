class DeliveryAddress < ApplicationRecord


belongs_to :member


validates :postcode, presence: true, length: {minimum: 2, maximum: 10}
validates :address, presence: true, length: {minimum: 2, maximum: 50}
validates :name, presence: true, length: {minimum: 2, maximum: 50}

  def full_address
   self.postcode + "    " + self.address + "    " + self.name
  end

end