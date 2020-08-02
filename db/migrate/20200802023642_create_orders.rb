class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.string :name
      t.string :postcode
      t.string :address
      t.boolean :is_payment_method
      t.integer :postage
      t.integer :order_status
      t.integer :total_price

      t.timestamps
    end
  end
end
