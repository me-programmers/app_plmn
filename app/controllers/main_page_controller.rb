class MainPageController < ApplicationController
	def homeforpasien
		@pasien_grid = initialize_grid(Pasien)
		#@pasien_grid = initialize_grid(Pasien.where(:tanggal => Time.now))
	end

	def homeforpasien2
		@get_pasiens = Pasien.all
	end
end
