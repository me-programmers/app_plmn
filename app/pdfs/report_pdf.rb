class ReportPdf < Prawn::Document
	include ActionView::Helpers::NumberHelper

  def initialize(pasien, currentuser)
    super()
    @pasien = pasien
    @hasil = Hasil2.where( "hsl_echantillon = #{@pasien.id_echantillon}").order("hsl_lab_item_order")
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
    draw_text ": #{case @pasien.jenis_kelamin 
                    when 1
                        'Perempuan' 
                    when 2
                        'Laki-laki' 
                    end
                    }", :at => [360, 640]
    
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

    draw_text "PEMERIKSAAN", :at => [40, 540]
    draw_text "HASIL", :at => [195, 540]
    draw_text "SATUAN", :at => [275, 540]
    draw_text "NILAI NORMAL", :at => [355, 540]
    draw_text "HISTORY", :at => [475, 540]

    move_down 190
    @hasil.each do |hasil|
  		table([ [
                "#{hasil.hsl_lab_item_name}", 
                "#{
                    case hasil.hsl_lab_item_name
                        when 'HBs Ag', 'A-HBs Rapid', 'VDRL', 'Ig G Anti Dengue', 'Ig M Anti Dengue', 'ANTI - HIV', 'Anti - HBs', 'Anti - HCV', 'HBsAg (Rapid)'
                            case hasil.hsl_result
                            when 1
                                'NON REAKTIF'
                            when 2
                                'REAKTIF'
                            end
                        when 'Stimulan', 'Barbiturat', 'Tes Kehamilan', 'Amphetamine', 'BZO', 'COCO', 'MET', 'MOP', 'THC', 'OPIAT'
                            case hasil.hsl_result
                            when 1
                                'NEGATIF'
                            when 2
                                'POSITIF'
                            end
                        when 'Keton', 'Reduksi', 'Protein'
                            case hasil.hsl_result
                            when 1
                                'NEGATIF'
                            when 2
                                '+'
                            when 3
                                '++'
                            when 4
                                '+++'
                            when 5
                                '++++'
                            end
                        when 'S. TYPHI O', 'S. TYPHI H', 'S. PARA TYPHI AO', 'S. PARA TYPHI BO', 'S. PARA TYPHI CO', 'S. PARA TYPHI AH', 'S. PARA TYPHI BH', 'S. PARA TYPHI CH'
                            case hasil.hsl_result
                            when 1
                                'NON REAKTIF'
                            when 2
                                '1/40'
                            when 3
                                '1/80'
                            when 4
                                '1/160'
                            when 5
                                '1/320'
                            when 6
                                '1/640'
                            end
                        when 'HBs Ag (ULTRA)'
                            case 
                            when hasil.hsl_result < 0.13
                                hasil.hsl_result.to_s + ' (NON REAKTIF)'
                            else
                                hasil.hsl_result.to_s + ' (REAKTIF)'
                            end
                        when 'Bleeding Time (BT)'
                            a = hasil.hsl_result.to_s.split(".")
                            case a[1].to_i
                            when 3
                                a[1]=30
                            end
                            a[0] + " mnt " + a[1].to_s + " dtk"                           

                        else
                            number_with_precision(hasil.hsl_result, precision: hasil.hsl_posisi_desimal)
                        end
                    }", 
                "#{hasil.hsl_lab_satuan}", 
                "#{hasil.hsl_lab_nilai_normal}", 
                "0"
                ] ] , :column_widths => [170, 105, 50, 140, 75] ) do
                
            case hasil.hsl_lab_item_name
            when 'S. TYPHI O', 'S. TYPHI H', 'S. PARA TYPHI AO', 'S. PARA TYPHI BO', 'S. PARA TYPHI CO', 'S. PARA TYPHI AH', 'S. PARA TYPHI BH', 'S. PARA TYPHI CH'
                #result = cells.column(1).rows(0)
                #case result
                #when 'NON REAKTIF'
                #else
                #    result.background_color = "FFAAAA"    
                #end
                
                
            else
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

    bounding_box([bounds.left, bounds.bottom+100], :width => 130, :height => 90) do
        move_down 0
        text "Mengetahui,", :inline_format => true, :align => :center
        move_down 0
        text "Ka. LABORATORIUM", :inline_format => true, :align => :center
        move_down 37
        text "<u>Drs. H. Purnomo</u>", :inline_format => true, :align => :center
        move_down 0
        text "LetKol CKM NRP. 31826", :inline_format => true, :align => :center
        transparent(0) { stroke_bounds }
    end 
    
    bounding_box([bounds.left + 200, bounds.bottom+100], :width => 150, :height => 90) do
        move_down 13
        text "Pemeriksa", :inline_format => true, :align => :center
        move_down 37
        text "#{@current_user}", :inline_format => true, :align => :center
        transparent(0) { stroke_bounds }
    end 

    bounding_box([bounds.right - 130, bounds.bottom+100], :width => 130, :height => 90) do
        move_down 13
        text "Penanggung Jawab", :inline_format => true, :align => :center
        move_down 37
        text "<u>dr. Suci Aprianti, Sp.PK</u>", :inline_format => true, :align => :center
        move_down 0
        text "NIP. 140 350 395", :inline_format => true, :align => :center
        transparent(0) { stroke_bounds }
    end 

  end  

end