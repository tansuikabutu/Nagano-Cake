class CreateDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_addresses do |t|
      t.integer :member_id
      t.string :postcode
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
