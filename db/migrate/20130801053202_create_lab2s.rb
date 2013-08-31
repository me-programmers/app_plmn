class CreateLab2s < ActiveRecord::Migration
  def change
    create_table :lab2s do |t|
      t.string :lab_item_pentra
      t.string :lab_item_report
      t.string :lab_satuan
      t.float :lab_batas_pl
      t.float :lab_batas_ph
      t.float :lab_batas_ll
      t.float :lab_batas_lh
      t.string :lab_nilai_normal
      t.integer :lab_posisi_desimal
      t.integer :lab_item_order

      t.timestamps
    end
  end
end
