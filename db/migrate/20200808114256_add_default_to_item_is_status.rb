class AddDefaultToItemIsStatus < ActiveRecord::Migration[5.2]
  def change
  	change_column_default(:items, :is_status, true)
  end
end
