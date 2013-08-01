class Hasil < ActiveRecord::Base
  belongs_to :pasien
  attr_accessible :an_echantillon, :faktor_pengali, :hasil_pemeriksaan, :item_pemeriksaan, :normal_lh, :normal_ll, :normal_ph, :normal_pl, :posisi_desimal, :satuan, :pasien_id
end
