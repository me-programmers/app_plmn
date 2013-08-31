class DisplayController < ApplicationController
	def satu		
		require "win32ole"

		rs = WIN32OLE.new("ADODB.recordset")
		rs2 = WIN32OLE.new("ADODB.recordset")
		qry = "SELECT TabPatient.strPatientId, TabPatient.strNom, TabPatient.strPrenom, TabPatient.eSex, TabEchantillon.strSID, TabDemande.dtCreation, TabService.strNom, TabMedecin.strNom, TabPatient.strCommentaire, TabEchantillon.anEchantillon 
			    FROM (((((TabPatient INNER JOIN TabDemande ON TabPatient.anPatient = TabDemande.anPatient) INNER JOIN TabEchantillonPatient ON TabDemande.anDemande = TabEchantillonPatient.anDemande) INNER JOIN TabEchantillon ON TabEchantillonPatient.anEchantillon = TabEchantillon.anEchantillon) INNER JOIN TabMedecin ON TabEchantillonPatient.anMedecin = TabMedecin.anMedecin) INNER JOIN TabService ON TabEchantillonPatient.anService = TabService.anService) INNER JOIN TabPortoir ON TabEchantillon.anPortoir = TabPortoir.anPortoir 
			    WHERE TabPatient.strPatientId='261526'"

		rs.open(qry,"DSN=GetDataPentra400;")
		
		sql_rs = []		
		rs.getrows.each do |row|
			sql_rs << row    
		end
		a = sql_rs.transpose	
			
		a.each do |idx|
			sql_vals = [ 
				Pasien.new( 
				:id_pasien => "#{idx[0]}", 
				:nama_pasien => "#{idx[1]}",
				:pangkat_jabatan => "#{idx[2]}",
				:jenis_kelamin => "#{idx[3]}",
				:id_sample => "#{idx[4]}",
				:tanggal => "#{idx[5]}",
				:ruangan => "#{idx[6]}",
				:pemeriksa => "#{idx[7]}",
				:komentar => "#{idx[8]}",
				:id_echantillon => "#{idx[9]}")
			]
				
			Pasien.import(sql_vals)
			#@get_client = sql_vals
		end

		
		a.each do |idx_1|
			rs2 = WIN32OLE.new("ADODB.recordset")
			qry2 = "SELECT TabMethodologie.strNom AS item_pemeriksaan, [TabResultat]![fResultat]*[TabMethodologieUnite]![fFacteurConvertion] AS hasil_pemeriksaan, TabUnite.strNom AS satuan, TabEchantillon.anEchantillon, Round([TabMethodologie]![fValeurNormaleBasseFemme]*[TabMethodologieUnite]![fFacteurConvertion],[TabMethodologie]![sPositionDecimale]) AS normal_pl, Round([TabMethodologie]![fValeurNormaleHauteFemme]*[TabMethodologieUnite]![fFacteurConvertion],[TabMethodologie]![sPositionDecimale]) AS normal_ph, Round([TabMethodologie]![fValeurNormaleHauteHomme]*[TabMethodologieUnite]![fFacteurConvertion],[TabMethodologie]![sPositionDecimale]) AS normal_ll, Round([TabMethodologie]![fValeurNormaleHauteHomme]*[TabMethodologieUnite]![fFacteurConvertion],[TabMethodologie]![sPositionDecimale]) AS normal_lh, TabMethodologieUnite.fFacteurConvertion AS faktor_pengali, TabMethodologie.sPositionDecimale AS posisi_desimal 
					FROM ((((TabEchantillon INNER JOIN TabTest ON TabEchantillon.anEchantillon = TabTest.anEchantillon) INNER JOIN TabResultat ON TabTest.anResultat = TabResultat.anResultat) INNER JOIN TabMethodologie ON TabTest.anMethodologie = TabMethodologie.anMethodologie) INNER JOIN TabMethodologieUnite ON TabMethodologie.anMethodologie = TabMethodologieUnite.anMethodologie) INNER JOIN TabUnite ON TabMethodologieUnite.anUnite = TabUnite.anUnite 
					WHERE (((TabEchantillon.anEchantillon)=#{idx_1[9]}) AND ((TabMethodologieUnite.bUniteDefaut)=True))"

			rs2.open(qry2,"DSN=GetDataPentra400;")
			
			sql_rs2 = []		
			rs2.getrows.each do |row2|
				sql_rs2 << row2    
			end
			a2 = sql_rs2.transpose	
				
			a2.each do |idx2|
				sql_vals2 = [ 
					Hasil.new(
					:item_pemeriksaan => "#{idx2[0]}",
				    :hasil_pemeriksaan => "#{idx2[1]}",
				    :satuan => "#{idx2[2]}",
				    :an_echantillon => "#{idx2[3]}",
				    :normal_pl => "#{idx2[4]}",
				    :normal_ph => "#{idx2[5]}",
				    :normal_ll => "#{idx2[6]}",
				    :normal_lh => "#{idx2[7]}",
				    :faktor_pengali => "#{idx2[8]}",
				    :posisi_desimal => "#{idx2[9]}",
				    :pasien_id => "#{idx_1[0]}")
				   ]
					
				Hasil.import(sql_vals2)
				@get_client = sql_vals2
			end
		end 

	end
	
	#FileUtils.cp "D:/2013_Project/app_plmn/pentra400_db/asp400bd.mdb", "D:/2013_Project/app_plmn/target db"

	def import2
		require "win32ole"

		#FileUtils.cp "D:/2013_Project/app_plmn/pentra400_db/asp400bd.mdb", "D:/2013_Project/app_plmn/target db"

		rs = WIN32OLE.new("ADODB.recordset")
		rs2 = WIN32OLE.new("ADODB.recordset")
		qry = "SELECT TabPatient.strPatientId, TabPatient.strNom, TabPatient.strPrenom, TabPatient.eSex, TabEchantillon.strSID, TabDemande.dtCreation, TabService.strNom, TabMedecin.strNom, TabPatient.strCommentaire, TabEchantillon.anEchantillon 
			    FROM (((((TabPatient INNER JOIN TabDemande ON TabPatient.anPatient = TabDemande.anPatient) INNER JOIN TabEchantillonPatient ON TabDemande.anDemande = TabEchantillonPatient.anDemande) INNER JOIN TabEchantillon ON TabEchantillonPatient.anEchantillon = TabEchantillon.anEchantillon) INNER JOIN TabMedecin ON TabEchantillonPatient.anMedecin = TabMedecin.anMedecin) INNER JOIN TabService ON TabEchantillonPatient.anService = TabService.anService) INNER JOIN TabPortoir ON TabEchantillon.anPortoir = TabPortoir.anPortoir 
			    WHERE TabPatient.strPatientId='261526'"

		rs.open(qry,"DSN=GetDataPentra400;")
		
		sql_rs = []		
		rs.getrows.each do |row|
			sql_rs << row    
		end
		a = sql_rs.transpose	
			
		a.each do |idx|
			sql_vals = [ 
				Pasien2.new( 
				:id_pasien => "#{idx[0]}", 
				:nama_pasien => "#{idx[1]}",
				:pangkat_jabatan => "#{idx[2]}",
				:jenis_kelamin => "#{idx[3]}",
				:umur => "0",
				:id_sample => "#{idx[4]}",
				:tanggal => "#{idx[5]}",
				:ruangan => "#{idx[6]}",
				:pemeriksa => "#{idx[7]}",
				:komentar => "#{idx[8]}",
				:id_echantillon => "#{idx[9]}")
			]
				
			Pasien2.import(sql_vals)
			#@get_client = sql_vals
		end

		
		a.each do |idx_1|
			rs2 = WIN32OLE.new("ADODB.recordset")
			qry2 = "SELECT TabMethodologie.strNom AS hsl_item, [TabResultat]![fResultat]*[TabMethodologieUnite]![fFacteurConvertion] AS hsl_result, TabUnite.strNom AS hsl_lab_satuan, TabEchantillon.anEchantillon AS hsl_echantillon, TabMethodologie.sPositionDecimale AS hsl_posisi_desimal
					FROM ((((TabEchantillon INNER JOIN TabTest ON TabEchantillon.anEchantillon = TabTest.anEchantillon) INNER JOIN TabResultat ON TabTest.anResultat = TabResultat.anResultat) INNER JOIN TabMethodologie ON TabTest.anMethodologie = TabMethodologie.anMethodologie) INNER JOIN TabMethodologieUnite ON TabMethodologie.anMethodologie = TabMethodologieUnite.anMethodologie) INNER JOIN TabUnite ON TabMethodologieUnite.anUnite = TabUnite.anUnite
					WHERE (((TabEchantillon.anEchantillon)=#{idx_1[9]}) AND ((TabMethodologieUnite.bUniteDefaut)=True));"

			rs2.open(qry2,"DSN=GetDataPentra400;")
			
			sql_rs2 = []		
			rs2.getrows.each do |row2|
				sql_rs2 << row2    
			end
			a2 = sql_rs2.transpose	
				
			a2.each do |idx2|
				sql_vals2 = [
					Hasil2.new(
					:hsl_echantillon => "#{idx2[3]}",
				    :hsl_item => "#{idx2[0]}",
				    :hsl_result => "#{idx2[1]}",
				    :hsl_batas_bawah => idx2[3] = 1 ? Lab2.where( :lab_item_pentra => idx2[0] ).pluck( :lab_batas_ll ).first : Lab2.where( :lab_item_pentra => idx2[0] ).pluck( :lab_batas_pl ).first,
				    :hsl_batas_atas => idx2[3] = 1 ? Lab2.where( :lab_item_pentra => idx2[0] ).pluck( :lab_batas_lh ).first : Lab2.where( :lab_item_pentra => idx2[0] ).pluck( :lab_batas_ph ).first,
				    :hsl_posisi_desimal => "#{idx2[4]}",
				    :hsl_id_pasien => "#{idx_1[0]}",
				    :hsl_lab_item_name => Lab2.where( :lab_item_pentra => idx2[0] ).pluck( :lab_item_report ).first,
				    :hsl_lab_satuan => "#{idx2[2]}",
				    :hsl_lab_item_order => Lab2.where( :lab_item_pentra => idx2[0] ).pluck( :lab_item_order ).first,
				    :hsl_lab_nilai_normal => Lab2.where( :lab_item_pentra => idx2[0] ).pluck( :lab_nilai_normal ).first,
				    )
				   ]
					
				Hasil2.import(sql_vals2)
				@get_client = sql_vals2
			end
		end

	end

	def import3
		if params[:search]
			# :begin_importing
			require "win32ole"

			#FileUtils.cp "D:/2013_Project/app_plmn/pentra400_db/asp400bd.mdb", "D:/2013_Project/app_plmn/target db"
			FileUtils.cp "D:/2013_Project/app_plmn/source_db/asp400bd.mdb", "D:/2013_Project/app_plmn/pentra400_db"
			#For P400@pelamonia, create error if no source found. Please make sure webclient & workstation service is starting
			#FileUtils.cp "Z:/asp400bd.mdb", "C:/DB_from_P400"

			rs = WIN32OLE.new("ADODB.recordset")
			rs2 = WIN32OLE.new("ADODB.recordset")
			qry = "SELECT TabPatient.strPatientId, TabPatient.strNom, TabPatient.strPrenom, TabPatient.eSex, TabEchantillon.strSID, TabDemande.dtCreation, TabService.strNom, TabMedecin.strNom, TabPatient.strCommentaire, TabEchantillon.anEchantillon 
				    FROM (((((TabPatient INNER JOIN TabDemande ON TabPatient.anPatient = TabDemande.anPatient) INNER JOIN TabEchantillonPatient ON TabDemande.anDemande = TabEchantillonPatient.anDemande) INNER JOIN TabEchantillon ON TabEchantillonPatient.anEchantillon = TabEchantillon.anEchantillon) INNER JOIN TabMedecin ON TabEchantillonPatient.anMedecin = TabMedecin.anMedecin) INNER JOIN TabService ON TabEchantillonPatient.anService = TabService.anService) INNER JOIN TabPortoir ON TabEchantillon.anPortoir = TabPortoir.anPortoir 
				    WHERE TabDemande.dtCreation=##{params[:search]}#"

			rs.open(qry,"DSN=GetDataPentra400;")
			
			sql_rs = []		
			rs.getrows.each do |row|
				sql_rs << row    
			end
			a = sql_rs.transpose	
				
			a.each do |idx|
				sql_vals = [ 
					Pasien2.new( 
					:id_pasien => "#{idx[0]}", 
					:nama_pasien => "#{idx[1]}",
					:pangkat_jabatan => "#{idx[2]}",
					:jenis_kelamin => "#{idx[3]}",
					:umur => "0",
					:id_sample => "#{idx[4]}",
					:tanggal => "#{idx[5]}",
					:ruangan => "#{idx[6]}",
					:pemeriksa => "#{idx[7]}",
					:komentar => "#{idx[8]}",
					:id_echantillon => "#{idx[9]}")
				]
					
				Pasien2.import(sql_vals)
				#@get_client = sql_vals
			end

			
			a.each do |idx_1|
				rs2 = WIN32OLE.new("ADODB.recordset")
				qry2 = "SELECT TabMethodologie.strNom AS hsl_item, [TabResultat]![fResultat]*[TabMethodologieUnite]![fFacteurConvertion] AS hsl_result, TabUnite.strNom AS hsl_lab_satuan, TabEchantillon.anEchantillon AS hsl_echantillon, TabMethodologie.sPositionDecimale AS hsl_posisi_desimal
						FROM ((((TabEchantillon INNER JOIN TabTest ON TabEchantillon.anEchantillon = TabTest.anEchantillon) INNER JOIN TabResultat ON TabTest.anResultat = TabResultat.anResultat) INNER JOIN TabMethodologie ON TabTest.anMethodologie = TabMethodologie.anMethodologie) INNER JOIN TabMethodologieUnite ON TabMethodologie.anMethodologie = TabMethodologieUnite.anMethodologie) INNER JOIN TabUnite ON TabMethodologieUnite.anUnite = TabUnite.anUnite
						WHERE (((TabEchantillon.anEchantillon)=#{idx_1[9]}) AND ((TabMethodologieUnite.bUniteDefaut)=True));"

				rs2.open(qry2,"DSN=GetDataPentra400;")
				
				sql_rs2 = []		
				rs2.getrows.each do |row2|
					sql_rs2 << row2    
				end
				a2 = sql_rs2.transpose	
					
				a2.each do |idx2|
					sql_vals2 = [
						Hasil2.new(
						:hsl_echantillon => "#{idx2[3]}",
					    :hsl_item => "#{idx2[0]}",
					    :hsl_result => "#{idx2[1]}",
					    :hsl_batas_bawah => idx2[3] = 1 ? Lab2.where( :lab_item_pentra => idx2[0] ).pluck( :lab_batas_ll ).first : Lab2.where( :lab_item_pentra => idx2[0] ).pluck( :lab_batas_pl ).first,
					    :hsl_batas_atas => idx2[3] = 1 ? Lab2.where( :lab_item_pentra => idx2[0] ).pluck( :lab_batas_lh ).first : Lab2.where( :lab_item_pentra => idx2[0] ).pluck( :lab_batas_ph ).first,
					    :hsl_posisi_desimal => "#{idx2[4]}",
					    :hsl_id_pasien => "#{idx_1[0]}",
					    :hsl_lab_item_name => Lab2.where( :lab_item_pentra => idx2[0] ).pluck( :lab_item_report ).first,
					    :hsl_lab_satuan => "#{idx2[2]}",
					    :hsl_lab_item_order => Lab2.where( :lab_item_pentra => idx2[0] ).pluck( :lab_item_order ).first,
					    :hsl_lab_nilai_normal => Lab2.where( :lab_item_pentra => idx2[0] ).pluck( :lab_nilai_normal ).first,
					    :hsl_lab_harga => Lab2.where( :lab_item_pentra => idx2[0] ).pluck( :lab_item_harga ).first,
					    )
					   ]
						
					Hasil2.import(sql_vals2)
					@get_client = sql_vals2
				end
			end
			# :end_importing
	     	@pasien_in_db = Pasien2.search(params[:search]).order("created_at DESC")

	    else
	    	@pasien_in_db = Pasien2.where("tanggal = '#{Date.today}'").order("created_at DESC")


		end

	end

end
