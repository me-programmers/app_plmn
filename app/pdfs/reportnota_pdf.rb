class ReportnotaPdf < Prawn::Document
	include ActionView::Helpers::NumberHelper

  def initialize(pasien, currentuser)
    super()
    @pasien = pasien
    @hasil = Hasil2.where( "hsl_echantillon = #{@pasien.id_echantillon}")
    @current_user = currentuser
    #font "Times-Roman", :style => :bold
    #font_size 18
    #text "RUMAH SAKIT PELAMONIA", :align => :center
    #move_down -5
    #font_size 24
    #text "LABORATORIUM KLINIK", :align => :center
    #move_down -7
    #font "Times-Roman", :style => :normal
    #font_size 10
    #text "Jl. Jend. Sudirman No. 27 Makassar", :align => :center
    #text "Telepon : (0411) 5390849", :align => :center

    #move_down -35
    font "Times-Roman", :style => :normal
    font_size 12
    draw_text "Rekam Medik", :at => [0, 660]
    draw_text ": #{@pasien.id_pasien}", :at => [80, 660]

    draw_text "Nama Depan", :at => [0, 640]
    draw_text ": #{@pasien.nama_pasien}", :at => [80, 640]

    draw_text "Pangkat/Kesatuan", :at => [260, 660]
    draw_text ": #{@pasien.pangkat_jabatan}", :at => [360, 660]

    draw_text "Jenis Kelamin", :at => [260, 640]
    draw_text ": #{@pasien.jenis_kelamin = 1? 'Perempuan' : 'Laki-laki' }", :at => [360, 640]
    
    draw_text "Umur", :at => [450, 640]
    draw_text ": #{@pasien.umur}", :at => [485, 640]

    draw_text "ID Sampel", :at => [0, 610]
    draw_text ": #{@pasien.id_sample}", :at => [80, 610]

    draw_text "Tanggal", :at => [0, 590]
    draw_text ": #{@pasien.tanggal}", :at => [80, 590]

    draw_text "Ruangan / Poli", :at => [0, 570]
    draw_text ": #{@pasien.ruangan}", :at => [80, 570]

    draw_text "Dokter", :at => [260, 610]
    draw_text ": #{@pasien.pemeriksa}", :at => [360, 610]

    draw_text "Komentar", :at => [260, 590]
    draw_text ": #{@pasien.komentar}", :at => [360, 590]

    draw_text "NOTA PEMERIKSAAN", :at => [195, 540]
    draw_text "PEMERIKSAAN", :at => [170, 520]
    draw_text "HARGA", :at => [320, 520]
    
    total = []

    move_down 205
    @hasil.each do |hasil|
  		indent(130) do
            table([ ["#{hasil.hsl_lab_item_name}", "#{number_with_delimiter(hasil.hsl_lab_harga)}"] ] , :column_widths => [175, 75] )
        end
        total << hasil.hsl_lab_harga

        #pdf.bounding_box(pdf.bounds.top_left, :width => x, :height => y) do
        #pdf.cell :content => 'your text', :background_color => 'E8E8D0', :width => x, :height => y, :align => :center, :text_color => "001B76"
        #pdf.move_down 4
        #https://groups.google.com/forum/#!topic/prawn-ruby/cUfZLsZIGUc
    end
  	
    bounding_box([130, cursor], :width => 175, :height => 25) do
        text("TOTAL", :align => :center, :valign => :center)
        transparent(1) { stroke_bounds }
    end

    bounding_box([305, cursor + 25], :width => 75, :height => 25) do
        draw_text "#{number_with_delimiter(total.reduce(:+))}", :at => [7, 10]
        transparent(1) { stroke_bounds }
    end

    bounding_box([bounds.left, bounds.bottom+100], :width => 130, :height => 90) do
        move_down 0
        text "   Mengetahui,", :inline_format => true
        move_down 0
        text "Ka. LABORATORIUM", :inline_format => true
        move_down 37
        text "<u>Drs. H. Purnomo</u>", :inline_format => true
        move_down 0
        text "LetKol CKM NRP. 31826", :inline_format => true
        transparent(0) { stroke_bounds }
    end 
    
    bounding_box([bounds.left + 230, bounds.bottom+100], :width => 130, :height => 90) do
        move_down 13
        text "Pemeriksa", :inline_format => true
        move_down 37
        text "<u>#{@current_user}</u>", :inline_format => true
        transparent(0) { stroke_bounds }
    end 

    bounding_box([bounds.right - 130, bounds.bottom+100], :width => 130, :height => 90) do
        move_down 13
        text "Penanggung Jawab", :inline_format => true
        move_down 37
        text "<u>dr. Suci Aprianti, Sp.PK</u>", :inline_format => true
        move_down 0
        text "NIP. 140 350 395", :inline_format => true
        transparent(0) { stroke_bounds }
    end 

  end  

end