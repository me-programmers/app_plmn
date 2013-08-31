class AddHargaToHasil2s < ActiveRecord::Migration
  def change
    add_column :hasil2s, :hsl_lab_harga, :integer
  end
end
