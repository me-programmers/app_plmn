class CreatePasiens < ActiveRecord::Migration
  def change
    create_table :pasiens do |t|
      t.string :id_pasien
      t.string :nama_pasien
      t.string :pangkat_jabatan
      t.integer :jenis_kelamin
      t.string :id_sample
      t.date :tanggal
      t.string :ruangan
      t.string :pemeriksa
      t.text :komentar
      t.integer :id_echantillon

      t.timestamps
    end
  end
end
