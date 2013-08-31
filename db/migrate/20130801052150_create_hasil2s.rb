class CreateHasil2s < ActiveRecord::Migration
  def change
    create_table :hasil2s do |t|
      t.integer :hsl_echantillon
      t.string :hsl_item
      t.float :hsl_result
      t.float :hsl_batas_bawah
      t.float :hsl_batas_atas
      t.integer :hsl_posisi_desimal
      t.string :hsl_id_pasien
      t.string :hsl_lab_item_name
      t.string :hsl_lab_satuan
      t.string :hsl_lab_item_order
      t.string :hsl_lab_nilai_normal

      t.timestamps
    end
  end
end
