class Report3Pdf < Prawn::Document
	include ActionView::Helpers::NumberHelper

  def initialize(pasien)
    super()
    @pasien = pasien
    @hasil = Hasil3.where( "hsl_echantillon = #{@pasien.id_echantillon}")
    
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
    
    draw_text "Umur", :at => [470, 620]
    draw_text ": #{@pasien.umur}", :at => [510, 620]

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
  		table([ ["#{hasil.hsl_lab_item_name}", "#{number_with_precision(hasil.hsl_result, precision: hasil.hsl_posisi_desimal)}", "#{hasil.hsl_lab_satuan}", "#{hasil.hsl_lab_nilai_normal}", "0"] ] , :column_widths => [175, 75, 75, 140, 75] ) do
            result = cells.column(1).rows(0)
            high = result.filter do |cell|
                cell.content.to_i > hasil.hsl_batas_atas.to_i
            end 
            high.background_color = "FFAAAA"

            low = result.filter do |cell|
                cell.content.to_i < hasil.hsl_batas_bawah.to_i
            end 
            low.background_color = "AAFFAA"
        end
  	end
    
  end 

end