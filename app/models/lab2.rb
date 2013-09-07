class Lab2 < ActiveRecord::Base
  default_scope order('lab_item_report ASC')
  attr_accessible :lab_batas_lh, :lab_batas_ll, :lab_batas_ph, :lab_batas_pl, :lab_item_pentra, :lab_item_report, :lab_item_order, :lab_nilai_normal, :lab_posisi_desimal, :lab_satuan, :lab_item_harga
end
