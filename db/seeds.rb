# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

#puts 'ROLES'
#YAML.load(ENV['ROLES']).each do |role|
#  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
#  puts 'role: ' << role
#end
#puts 'DEFAULT USERS'
#user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
#puts 'user: ' << user.name
#user.add_role :admin

lab2s = Lab2.create([
	{ lab_item_pentra:"Globulin", lab_item_report:"Globulin" , lab_satuan:"gr/dl", lab_batas_pl:"1.5", lab_batas_ph:"3", lab_batas_ll:"1.5", lab_batas_lh:"3", lab_nilai_normal:"1,5 - 3   gr/dl", lab_posisi_desimal:"1", lab_item_order:"1" },
	{ lab_item_pentra:"Gula Darah Sewaktu", lab_item_report:"Gula Darah Sewaktu" , lab_satuan:"mg/dl", lab_batas_pl:"70", lab_batas_ph:"140", lab_batas_ll:"70", lab_batas_lh:"140", lab_nilai_normal:"70 - 140   mg/dl", lab_posisi_desimal:"0", lab_item_order:"2" },
	{ lab_item_pentra:"Gula Darah 2 Jam PP", lab_item_report:"Gula Darah 2 Jam PP" , lab_satuan:"mg/dl", lab_batas_pl:"80", lab_batas_ph:"140", lab_batas_ll:"80", lab_batas_lh:"140", lab_nilai_normal:"80 - 140    mg/dl", lab_posisi_desimal:"0", lab_item_order:"3" },
	{ lab_item_pentra:"Gula Darah Puasa", lab_item_report:"Gula Darah Puasa" , lab_satuan:"mg/dl", lab_batas_pl:"70", lab_batas_ph:"110", lab_batas_ll:"70", lab_batas_lh:"110", lab_nilai_normal:"70 - 110    mg/dl", lab_posisi_desimal:"0", lab_item_order:"4" },
	{ lab_item_pentra:"Glukosa 2 Jam (TTGO)", lab_item_report:"Glukosa 2 Jam (TTGO)" , lab_satuan:"mg/dl", lab_batas_pl:"80", lab_batas_ph:"140", lab_batas_ll:"80", lab_batas_lh:"140", lab_nilai_normal:"80 - 140    mg/dl", lab_posisi_desimal:"0", lab_item_order:"5" },
	{ lab_item_pentra:"Glukosa 2 Jam PP", lab_item_report:"Glukosa 2 Jam PP" , lab_satuan:"mg/dl", lab_batas_pl:"80", lab_batas_ph:"140", lab_batas_ll:"80", lab_batas_lh:"140", lab_nilai_normal:"80 - 140    mg/dl", lab_posisi_desimal:"0", lab_item_order:"6" },
	{ lab_item_pentra:"Natrium", lab_item_report:"Natrium" , lab_satuan:"mmol/L", lab_batas_pl:"136", lab_batas_ph:"145", lab_batas_ll:"136", lab_batas_lh:"145", lab_nilai_normal:"136 - 145    mmol/L", lab_posisi_desimal:"0", lab_item_order:"7" },
	{ lab_item_pentra:"Kalium", lab_item_report:"Kalium" , lab_satuan:"mmol/L", lab_batas_pl:"3.5", lab_batas_ph:"5.1", lab_batas_ll:"3.5", lab_batas_lh:"5.1", lab_nilai_normal:"3,5 - 5,1   mmol/L", lab_posisi_desimal:"1", lab_item_order:"8" },
	{ lab_item_pentra:"Chlorida", lab_item_report:"Chlorida" , lab_satuan:"mmol/L", lab_batas_pl:"98", lab_batas_ph:"106", lab_batas_ll:"98", lab_batas_lh:"106", lab_nilai_normal:"98 - 106   mmol/L", lab_posisi_desimal:"0", lab_item_order:"9" },
	{ lab_item_pentra:"Bleeding Time (BT)", lab_item_report:"Bleeding Time (BT)" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"3", lab_batas_ll:"1", lab_batas_lh:"3", lab_nilai_normal:"1 - 3", lab_posisi_desimal:"0", lab_item_order:"10" },
	{ lab_item_pentra:"Clotting Time (CT)", lab_item_report:"Clotting Time (CT)" , lab_satuan:"-", lab_batas_pl:"4", lab_batas_ph:"10", lab_batas_ll:"4", lab_batas_lh:"10", lab_nilai_normal:"4 - 10", lab_posisi_desimal:"0", lab_item_order:"11" },
	{ lab_item_pentra:"LED", lab_item_report:"LED" , lab_satuan:"mm/jam", lab_batas_pl:"0", lab_batas_ph:"20", lab_batas_ll:"0", lab_batas_lh:"15", lab_nilai_normal:"0 - 20    mm/jam", lab_posisi_desimal:"0", lab_item_order:"12" },
	{ lab_item_pentra:"S. TYPHI O", lab_item_report:"S. TYPHI O" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"13" },
	{ lab_item_pentra:"S. TYPHI H", lab_item_report:"S. TYPHI H" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"14" },
	{ lab_item_pentra:"S. PARA TYPHI AO", lab_item_report:"S. PARA TYPHI AO" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"15" },
	{ lab_item_pentra:"S. PARA TYPHI BO", lab_item_report:"S. PARA TYPHI BO" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"16" },
	{ lab_item_pentra:"S. PARA TYPHI CO", lab_item_report:"S. PARA TYPHI CO" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"17" },
	{ lab_item_pentra:"S. PARA TYPHI AH", lab_item_report:"S. PARA TYPHI AH" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"18" },
	{ lab_item_pentra:"S. PARA TYPHI BH", lab_item_report:"S. PARA TYPHI BH" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"19" },
	{ lab_item_pentra:"S. PARA TYPHI CH", lab_item_report:"S. PARA TYPHI CH" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"20" },
	{ lab_item_pentra:"ANTI - HIV", lab_item_report:"ANTI - HIV" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"21" },
	{ lab_item_pentra:"DDR / MALARIA", lab_item_report:"DDR / MALARIA" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"22" },
	{ lab_item_pentra:"Ig G Anti Dengue", lab_item_report:"Ig G Anti Dengue" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"23" },
	{ lab_item_pentra:"Ig M Anti Dengue", lab_item_report:"Ig M Anti Dengue" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"24" },
	{ lab_item_pentra:"HBs Ag", lab_item_report:"HBs Ag" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"25" },
	{ lab_item_pentra:"Anti - HBs", lab_item_report:"Anti - HBs" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"26" },
	{ lab_item_pentra:"Anti - HCV", lab_item_report:"Anti - HCV" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"27" },
	{ lab_item_pentra:"Tes Kehamilan", lab_item_report:"Tes Kehamilan" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"28" },
	{ lab_item_pentra:"VDRL", lab_item_report:"VDRL" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"29" },
	{ lab_item_pentra:"Amphetamine", lab_item_report:"Amphetamine" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"30" },
	{ lab_item_pentra:"BZO", lab_item_report:"BZO" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"31" },
	{ lab_item_pentra:"COCO", lab_item_report:"COCO" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"32" },
	{ lab_item_pentra:"MET", lab_item_report:"MET" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"33" },
	{ lab_item_pentra:"MOP", lab_item_report:"MOP" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"34" },
	{ lab_item_pentra:"THC", lab_item_report:"THC" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"35" },
	{ lab_item_pentra:"OPIAT", lab_item_report:"OPIAT" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"36" },
	{ lab_item_pentra:"Kolesterol Total", lab_item_report:"Kolesterol Total" , lab_satuan:"mg/dl", lab_batas_pl:"0", lab_batas_ph:"200", lab_batas_ll:"0", lab_batas_lh:"200", lab_nilai_normal:"0 - 200   mg/dl", lab_posisi_desimal:"0", lab_item_order:"37" },
	{ lab_item_pentra:"Kolesterol HDL", lab_item_report:"Kolesterol HDL" , lab_satuan:"mg/dl", lab_batas_pl:"40", lab_batas_ph:"1000", lab_batas_ll:"40", lab_batas_lh:"1000", lab_nilai_normal:"40 - 1000   mg/dl", lab_posisi_desimal:"0", lab_item_order:"38" },
	{ lab_item_pentra:"Kolesterol LDL", lab_item_report:"Kolesterol LDL" , lab_satuan:"mg/dl", lab_batas_pl:"0", lab_batas_ph:"100", lab_batas_ll:"0", lab_batas_lh:"100", lab_nilai_normal:"0 - 100   mg/dl", lab_posisi_desimal:"0", lab_item_order:"39" },
	{ lab_item_pentra:"Triglyserida", lab_item_report:"Triglyserida" , lab_satuan:"mg/dl", lab_batas_pl:"0", lab_batas_ph:"150", lab_batas_ll:"0", lab_batas_lh:"150", lab_nilai_normal:"0 - 150   mg/dl", lab_posisi_desimal:"0", lab_item_order:"40" },
	{ lab_item_pentra:"Reduksi", lab_item_report:"Reduksi" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"41" },
	{ lab_item_pentra:"Protein Total", lab_item_report:"Protein Total" , lab_satuan:"mg/dl", lab_batas_pl:"6.6", lab_batas_ph:"8.7", lab_batas_ll:"6.6", lab_batas_lh:"8.7", lab_nilai_normal:"6,6 - 8,7   mg/dl", lab_posisi_desimal:"1", lab_item_order:"42" },
	{ lab_item_pentra:"Hemoglobin", lab_item_report:"Hemoglobin" , lab_satuan:"Gr %", lab_batas_pl:"12", lab_batas_ph:"16", lab_batas_ll:"14", lab_batas_lh:"18", lab_nilai_normal:"L:14 - 18   P:12 - 16   Gr %", lab_posisi_desimal:"0", lab_item_order:"43" },
	{ lab_item_pentra:"Eritrosit", lab_item_report:"Eritrosit" , lab_satuan:"Jt/mm", lab_batas_pl:"4", lab_batas_ph:"5.6", lab_batas_ll:"4.5", lab_batas_lh:"6", lab_nilai_normal:"L:4,5 - 6   P:4 - 5,6   Jt/mm", lab_posisi_desimal:"1", lab_item_order:"44" },
	{ lab_item_pentra:"Uric Acid", lab_item_report:"Asam Urat" , lab_satuan:"mg/dl", lab_batas_pl:"2.4", lab_batas_ph:"5.7", lab_batas_ll:"3.4", lab_batas_lh:"7", lab_nilai_normal:"L:3,4 - 7   P:2,4 - 5,7   mg/dl", lab_posisi_desimal:"1", lab_item_order:"45" },
	{ lab_item_pentra:"Urea", lab_item_report:"Ureum" , lab_satuan:"mg/dl", lab_batas_pl:"10", lab_batas_ph:"50", lab_batas_ll:"10", lab_batas_lh:"50", lab_nilai_normal:"10 - 50   mg/dl", lab_posisi_desimal:"0", lab_item_order:"46" },
	{ lab_item_pentra:"CREA3", lab_item_report:"Kreatinin" , lab_satuan:"mg/dl", lab_batas_pl:"0.6", lab_batas_ph:"1.1", lab_batas_ll:"0.7", lab_batas_lh:"1.3", lab_nilai_normal:"L:0,7 - 1,3   P:0,6 - 1,1   mg/dl", lab_posisi_desimal:"1", lab_item_order:"47" },
	{ lab_item_pentra:"ALKALI PHOSPAT", lab_item_report:"Alkali Posphat" , lab_satuan:"U/L", lab_batas_pl:"0", lab_batas_ph:"240", lab_batas_ll:"0", lab_batas_lh:"270", lab_nilai_normal:"0 - 240   U/L", lab_posisi_desimal:"0", lab_item_order:"48" },
	{ lab_item_pentra:"GGT", lab_item_report:"Gamma GT" , lab_satuan:"U/L", lab_batas_pl:"7", lab_batas_ph:"32", lab_batas_ll:"11", lab_batas_lh:"49", lab_nilai_normal:"L:11 - 49   P:7 - 32   U/L", lab_posisi_desimal:"0", lab_item_order:"49" },
	{ lab_item_pentra:"ALT", lab_item_report:"SGOT" , lab_satuan:"U/L", lab_batas_pl:"0", lab_batas_ph:"31", lab_batas_ll:"0", lab_batas_lh:"37", lab_nilai_normal:"0 - 31   U/L", lab_posisi_desimal:"0", lab_item_order:"50" },
	{ lab_item_pentra:"AST", lab_item_report:"SGPT" , lab_satuan:"U/L", lab_batas_pl:"0", lab_batas_ph:"32", lab_batas_ll:"0", lab_batas_lh:"42", lab_nilai_normal:"0 - 32   U/L", lab_posisi_desimal:"0", lab_item_order:"51" },
	{ lab_item_pentra:"Bilirubin Total", lab_item_report:"Bilirubin Total" , lab_satuan:"mg/dl", lab_batas_pl:"0", lab_batas_ph:"1.1", lab_batas_ll:"0", lab_batas_lh:"1.1", lab_nilai_normal:"0 - 1,1   mg/dl", lab_posisi_desimal:"1", lab_item_order:"52" },
	{ lab_item_pentra:"Bilirubin Direk", lab_item_report:"Bilirubin Direk" , lab_satuan:"mg/dl", lab_batas_pl:"0", lab_batas_ph:"0.25", lab_batas_ll:"0", lab_batas_lh:"0.25", lab_nilai_normal:"0 - 0,25   mg/dl", lab_posisi_desimal:"2", lab_item_order:"53" },
	{ lab_item_pentra:"Bilirubin Indirek", lab_item_report:"Bilirubin Indirek" , lab_satuan:"mg/dl", lab_batas_pl:"0", lab_batas_ph:"0.75", lab_batas_ll:"0", lab_batas_lh:"0.75", lab_nilai_normal:"0 - 0,75   mg/dl", lab_posisi_desimal:"2", lab_item_order:"54" },
	{ lab_item_pentra:"PT", lab_item_report:"PT" , lab_satuan:"detik", lab_batas_pl:"10.8", lab_batas_ph:"14.4", lab_batas_ll:"10.8", lab_batas_lh:"14.4", lab_nilai_normal:"10,8 - 14,4   detik", lab_posisi_desimal:"1", lab_item_order:"55" },
	{ lab_item_pentra:"APTT", lab_item_report:"APTT" , lab_satuan:"detik", lab_batas_pl:"26.4", lab_batas_ph:"37.6", lab_batas_ll:"26.4", lab_batas_lh:"37.6", lab_nilai_normal:"26,4 - 37,6   detik", lab_posisi_desimal:"1", lab_item_order:"56" },
	{ lab_item_pentra:"HbA1c", lab_item_report:"HbA1c" , lab_satuan:"persen", lab_batas_pl:"6.5", lab_batas_ph:"8", lab_batas_ll:"6.5", lab_batas_lh:"8", lab_nilai_normal:"6,5 - 8   persen", lab_posisi_desimal:"1", lab_item_order:"57" },
	{ lab_item_pentra:"Bilirubin Indirek", lab_item_report:"Bilirubin Indirek" , lab_satuan:"mg/dl", lab_batas_pl:"0", lab_batas_ph:"0.75", lab_batas_ll:"0", lab_batas_lh:"0.75", lab_nilai_normal:"0 - 0,75   mg/dl", lab_posisi_desimal:"2", lab_item_order:"58" },
	{ lab_item_pentra:"Albumin", lab_item_report:"Albumin" , lab_satuan:"mg/dl", lab_batas_pl:"3.5", lab_batas_ph:"5", lab_batas_ll:"3.5", lab_batas_lh:"5", lab_nilai_normal:"3,5 - 5   mg/dl", lab_posisi_desimal:"1", lab_item_order:"59" },
	{ lab_item_pentra:"Stimulan", lab_item_report:"Stimulan" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"60" },
	{ lab_item_pentra:"Barbiturat", lab_item_report:"Barbiturat" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"61" },
	{ lab_item_pentra:"Leukosit", lab_item_report:"Leukosit" , lab_satuan:"leu/ml", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1   leu/ml", lab_posisi_desimal:"0", lab_item_order:"62" },
	{ lab_item_pentra:"Nitrit", lab_item_report:"Nitrit" , lab_satuan:"-", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1", lab_posisi_desimal:"0", lab_item_order:"63" },
	{ lab_item_pentra:"Urobilinogen", lab_item_report:"Urobilinogen" , lab_satuan:"mg/dl", lab_batas_pl:"0.2", lab_batas_ph:"1000", lab_batas_ll:"0.2", lab_batas_lh:"1000", lab_nilai_normal:"0,2 - 1000   mg/dl", lab_posisi_desimal:"1", lab_item_order:"64" },
	{ lab_item_pentra:"Protein/Albumin", lab_item_report:"Protein/Albumin" , lab_satuan:"mg/dl", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1   mg/dl", lab_posisi_desimal:"0", lab_item_order:"65" },
	{ lab_item_pentra:"pH", lab_item_report:"pH" , lab_satuan:"-", lab_batas_pl:"0", lab_batas_ph:"5", lab_batas_ll:"0", lab_batas_lh:"5", lab_nilai_normal:"0 - 5", lab_posisi_desimal:"0", lab_item_order:"66" },
	{ lab_item_pentra:"Eritrosit", lab_item_report:"Eritrosit" , lab_satuan:"eri/ml", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1   eri/ml", lab_posisi_desimal:"0", lab_item_order:"67" },
	{ lab_item_pentra:"Berat Jenis", lab_item_report:"Berat Jenis" , lab_satuan:"-", lab_batas_pl:"1000", lab_batas_ph:"100000", lab_batas_ll:"1000", lab_batas_lh:"100000", lab_nilai_normal:"1000 - 100000", lab_posisi_desimal:"0", lab_item_order:"68" },
	{ lab_item_pentra:"Keton", lab_item_report:"Keton" , lab_satuan:"mg/dl", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1   mg/dl", lab_posisi_desimal:"0", lab_item_order:"69" },
	{ lab_item_pentra:"Bilirubin", lab_item_report:"Bilirubin" , lab_satuan:"mg/dl", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1   mg/dl", lab_posisi_desimal:"0", lab_item_order:"70" },
	{ lab_item_pentra:"Glukosa", lab_item_report:"Glukosa" , lab_satuan:"mg/dl", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1   mg/dl", lab_posisi_desimal:"0", lab_item_order:"71" },
	{ lab_item_pentra:"As.Ascorbat", lab_item_report:"As.Ascorbat" , lab_satuan:"mg/dl", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1   mg/dl", lab_posisi_desimal:"0", lab_item_order:"72" },
	{ lab_item_pentra:"Leukosit (Sedimen)", lab_item_report:"Leukosit (Sedimen)" , lab_satuan:"sel/LP", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1   sel/LP", lab_posisi_desimal:"0", lab_item_order:"73" },
	{ lab_item_pentra:"Eritrosit (Sedimen)", lab_item_report:"Eritrosit (Sedimen)" , lab_satuan:"sel/LP", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1   sel/LP", lab_posisi_desimal:"0", lab_item_order:"74" },
	{ lab_item_pentra:"Epitel (Sedimen)", lab_item_report:"Epitel (Sedimen)" , lab_satuan:"sel/LP", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1   sel/LP", lab_posisi_desimal:"0", lab_item_order:"75" },
	{ lab_item_pentra:"Kristal (Sedimen)", lab_item_report:"Kristal (Sedimen)" , lab_satuan:"sel/LP", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1   sel/LP", lab_posisi_desimal:"0", lab_item_order:"76" },
	{ lab_item_pentra:"Bakteri (Sedimen)", lab_item_report:"Bakteri (Sedimen)" , lab_satuan:"sel/LP", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1   sel/LP", lab_posisi_desimal:"0", lab_item_order:"77" },
	{ lab_item_pentra:"As.Urat (Sedimen)", lab_item_report:"As.Urat (Sedimen)" , lab_satuan:"sel/LP", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1   sel/LP", lab_posisi_desimal:"0", lab_item_order:"78" },
	{ lab_item_pentra:"Ca.Ox (Sedimen)", lab_item_report:"Ca.Ox (Sedimen)" , lab_satuan:"sel/LP", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1   sel/LP", lab_posisi_desimal:"0", lab_item_order:"79" },
	{ lab_item_pentra:"Silinder (Sedimen)", lab_item_report:"Silinder (Sedimen)" , lab_satuan:"sel/LP", lab_batas_pl:"1", lab_batas_ph:"1", lab_batas_ll:"1", lab_batas_lh:"1", lab_nilai_normal:"1 - 1   sel/LP", lab_posisi_desimal:"0", lab_item_order:"80" }

])