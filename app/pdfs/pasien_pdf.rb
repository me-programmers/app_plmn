class PasienPdf < Prawn::Document
	include ActionView::Helpers::NumberHelper

  def initialize(pasien)
    super()
    @pasien = pasien
    @hasil = Hasil.where("an_echantillon= '#{@pasien.id_echantillon}'")
    
    font "Times-Roman", :style => :bold
    font_size 18
    text "RUMAH SAKIT PELAMONIA", :align => :center
    move_down -5
    font_size 24
    text "LABORATORIUM KLINIK", :align => :center
    move_down -7
    font "Times-Roman", :style => :normal
    font_size 10
    text "Jl. Jend. Sudirman No. 27 Makassar", :align => :center
    text "Telepon : (0411) 5390849", :align => :center

    move_down 10
    font "Times-Roman", :style => :normal
    font_size 12
    draw_text "Rekam Medik", :at => [0, 640]
    draw_text ": #{@pasien.id_pasien}", :at => [80, 640]

    draw_text "Nama Depan", :at => [0, 620]
    draw_text ": #{@pasien.nama_pasien}", :at => [80, 620]

    draw_text "Pangkat/Kesatuan", :at => [270, 640]
    draw_text ": #{@pasien.pangkat_jabatan}", :at => [370, 640]

    draw_text "Jenis Kelamin", :at => [270, 620]
    draw_text ": #{@pasien.jenis_kelamin = 1? 'Laki-laki' : 'Perempuan' }", :at => [370, 620]
    
    draw_text "ID Sampel", :at => [0, 590]
    draw_text ": #{@pasien.id_sample}", :at => [80, 590]

    draw_text "Tanggal", :at => [0, 570]
    draw_text ": #{@pasien.tanggal}", :at => [80, 570]

    draw_text "Ruangan / Poli", :at => [0, 550]
    draw_text ": #{@pasien.ruangan}", :at => [80, 550]

    draw_text "Dokter", :at => [270, 590]
    draw_text ": #{@pasien.pemeriksa}", :at => [370, 590]

    draw_text "Komentar", :at => [270, 570]
    draw_text ": #{@pasien.komentar}", :at => [370, 570]

    draw_text "PEMERIKSAAN", :at => [40, 520]
    draw_text "HASIL", :at => [195, 520]
    draw_text "SATUAN", :at => [265, 520]
    draw_text "NILAI NORMAL", :at => [355, 520]
    draw_text "HISTORY", :at => [475, 520]

    move_down 140
    @hasil.each do |hasil|
    	table([ ["#{case hasil.item_pemeriksaan
    					when 'GLUCOSE SEWAKTU', 'Glucose HK', 'GLUKOSA SEWAKTU'
    						'Glukosa Sewaktu'
    					when 'GLUCOSE PAP'
    						'Glukosa Puasa'
    					when 'GLUCOSE 2 JAM'
    						'Glukosa 2 Jam'
    					when 'Total Bilirubin'
    						'Bilirubin Total'
    					when 'Direct Bilirubin'
    						'Bilirubin Direct'
    					when 'Indirect Bilirubin'
    						'Bilirubin Indirect'
    					when 'AST'
    						'SGOT'
    					when 'ALT'
    						'SGPT'
    					when 'Alkali Phospat'
    						'Alkali Fosfatase'
    					when 'GGT', 'GGT-RACK'
    						'Gamma GT'    					
    					when 'GLOB'
    						'Globulin'
    					when 'Creatinine'
    						'Kreatinin'
    					when 'Uric Acid'
    						'Asam Urat'
    					when 'UREA'
    						'Ureum'
    					when 'Cholesterol'
    						'Kolesterol Total'
    					when 'Triglycerides'
    						'Trigliserida'
    					when 'Cholesterol HDL'
    						'Kolesterol HDL'
    					when 'Cholesterol LDL'
    						'Kolesterol LDL'
    					when 'Albumin'
    						'Albumin'
    					when 'Kreatinin', 'Creatinine 2', 'CREATIN'
    						'Kreatinin'	
    					when 'Total Protein'
    						'Protein Total'
    					else
    						hasil.item_pemeriksaan
    				end
    				}", "#{number_with_precision(hasil.hasil_pemeriksaan, precision: hasil.posisi_desimal)}", "#{
    				case hasil.item_pemeriksaan
    					when 'GLUCOSE SEWAKTU'
    						'mg/dl'
    					when 'GLUCOSE PAP'
    						'mg/dl'
    					when 'GLUCOSE 2 JAM'
    						'mg/dl'
    					when 'Total Bilirubin'
    						'mg/dl'
    					when 'Direct Bilirubin'
    						'mg/dl'
    					when 'AST'
    						'u/l'
    					when 'ALT'
    						'u/l'
    					when 'Alkali Phospat'
    						'u/l'
    					when 'GGT', 'GGT-RACK'
    						'u/l'
    					when 'Creatinine', 'Kreatinin', 'Creatinine 2', 'CREATIN'
    						'u/l'
    					when 'Uric Acid'
    						'u/l'
    					when 'UREA'
    						'mg/dl'
    					when 'Cholesterol'
    						'mg/dl'
    					when 'Triglycerides'
    						'mg/dl'
    					when 'Cholesterol HDL'
    						'mg/dl'
    					when 'Cholesterol LDL'
    						'mg/dl'
    					when 'Albumin'
    						'gr/dl'
    					when 'Glucose HK'
    						'mg/dl'
    					when 'Total Protein'
    						'gr/dl'
    					else
    						'--'
    				end
    				}", "#{
    				case hasil.item_pemeriksaan
    					when 'GLUCOSE SEWAKTU'
    						'< 140   mg/dl'
    					when 'GLUCOSE PAP'
    						'80 - 100   mg/dl'
    					when 'GLUCOSE 2 JAM'
    						'< 140   mg/dl'
    					when 'Total Bilirubin'
    						'0-1,1   mg/dl'
    					when 'Direct Bilirubin'
    						'0-0,25    mg/dl'
    					when 'AST'
    						'L:<37    P:<31    u/l'
    					when 'ALT'
    						'L:<42    P:<32    u/l'
    					when 'Alkali Phospat'
    						'L:<270   P:<240   u/l'
    					when 'GGT', 'GGT-RACK'
    						'L:11-49   P:7-32    u/l'
    					when 'Creatinine', 'Kreatinin', 'Creatinine 2', 'CREATIN'
    						'L:0,7-1,3   P:0,6-1,1   u/l'
    					when 'Uric Acid'
    						'L:3,4-7,0   P:2,4-5,7   u/l'
    					when 'UREA'
    						'10-50   mg/dl'
    					when 'Cholesterol'
    						'<200   mg/dl'
    					when 'Triglycerides'
    						'<150   mg/dl'
    					when 'Cholesterol HDL'
    						'>40   mg/dl'
    					when 'Cholesterol LDL'
    						'<150   mg/dl'
    					when 'Albumin'
    						'3,5-5,0   gr/dl'
    					when 'Glucose HK'
    						'<140   mg/dl'
    					when 'Total Protein'
    						'6,6-8,7   gr/dl'
    					else
    						'--'
    				end
    				}", "0"] ], :column_widths => [175, 75, 75, 140, 75] ) do
	    	result = cells.column(1).rows(0)
	    	high = result.filter do |cell|
	    		cell.content.to_i > hasil.normal_ph
	    	end 
	    	high.background_color = "FFAAAA"

	    	low = result.filter do |cell|
	    		cell.content.to_i < hasil.normal_pl
	    	end 
	    	low.background_color = "AAFFAA"

	    end
    end

    #result = cells.column(2).rows(1..-1)
    #high = result.filter do |cell|
    #	cell.content.to_i > 1
    #end 
    #high.background_color = "FFAAAA"
    
    #data_row = []
	#@hasil.map do |hasil|
  	#	@data_row = [ ["#{hasil.item_pemeriksaan}", "#{number_with_precision(hasil.hasil_pemeriksaan, precision: hasil.posisi_desimal)}", "#{hasil.satuan}", "nilai normal", "0"] ]
  	#end
    #
    #table (@data_row) #, :column_widths => [175, 75, 75, 140, 75])

  end 

end