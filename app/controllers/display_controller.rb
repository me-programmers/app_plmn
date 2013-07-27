class DisplayController < ApplicationController
	def satu		
		require "win32ole"

		rs = WIN32OLE.new("ADODB.recordset")
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
			@get_client = sql_vals
		end

	end
	
	#FileUtils.cp "D:/2013_Project/app_plmn/pentra400_db/asp400bd.mdb", "D:/2013_Project/app_plmn/target db"

end
