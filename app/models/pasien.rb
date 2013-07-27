class Pasien < ActiveRecord::Base
  attr_accessible :id_echantillon, :id_pasien, :id_sample, :jenis_kelamin, :komentar, :nama_pasien, :pangkat_jabatan, :pemeriksa, :ruangan, :tanggal
  
  def self.search(search)
  	if search
      #where('nama_pasien LIKE ?', "%#{name_search}%")
      where('tanggal = ?', "%#{search}%")
    else
      scoped
    end
  end
end
