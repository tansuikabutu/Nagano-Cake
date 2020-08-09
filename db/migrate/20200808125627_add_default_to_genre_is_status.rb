class AddDefaultToGenreIsStatus < ActiveRecord::Migration[5.2]
  def change
  	change_column_default(:genres, :is_status, true)
  end
end
