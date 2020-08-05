class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :cart_items
 has_many :delivery_addresses,dependent: :destroy

  # バリデーション
  validates :first_name,presence: true
  validates :first_name_kana,presence: true
  validates :last_name,presence: true
  validates :last_name_kana,presence: true
  validates :postcode,presence: true
  validates :address,presence: true
  validates :phone_number,presence: true

  
  #退会後のユーザー（is_statusがtrue）はログインできないようにする＝＞is_statusがfalseの人だけログイン可

  def active_for_authentication?
    super && (self.is_status == false)
  end

end
