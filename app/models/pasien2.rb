class Pasien2 < ActiveRecord::Base
  attr_accessible :id_echantillon, :id_pasien, :id_sample, :jenis_kelamin, :komentar, :nama_pasien, :pangkat_jabatan, :pemeriksa, :ruangan, :tanggal, :umur
  validates :tanggal, :uniqueness => { :scope => :id_pasien }

  def self.search(search)
  	if search
      where('tanggal = ?', "%#{search}%")
    else
      scoped
    end
  end

  def self.searchidname(s)
    if s
      where('id_pasien LIKE ? OR nama_pasien LIKE ?', "%#{s}%", "%#{s}%")
    else
      scoped
    end
  end

  def self.searchtglidname(t, s)
    if t.present? && s.present?
      where('(id_pasien LIKE ? OR nama_pasien LIKE ?) AND tanggal = ?', "%#{s}%", "%#{s}%", "%#{t}%")
    else
      scoped
    end
  end
end
