class CreatePasien3s < ActiveRecord::Migration
  def change
    create_table :pasien3s do |t|
      t.string :id_pasien
      t.string :nama_pasien
      t.string :pangkat_jabatan
      t.integer :jenis_kelamin
      t.integer :umur
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
