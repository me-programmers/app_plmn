class AddHargaToLab2s < ActiveRecord::Migration
  def change
  	add_column :lab2s, :lab_item_harga, :integer
  end
end
