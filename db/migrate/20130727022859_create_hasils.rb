class CreateHasils < ActiveRecord::Migration
  def change
    create_table :hasils do |t|
      t.string :item_pemeriksaan
      t.float :hasil_pemeriksaan
      t.string :satuan
      t.integer :an_echantillon
      t.float :normal_pl
      t.float :normal_ph
      t.float :normal_ll
      t.float :normal_lh
      t.float :faktor_pengali
      t.integer :posisi_desimal
      t.references :pasien

      t.timestamps
    end
    add_index :hasils, :pasien_id
  end
end
