class Hasil2sController < ApplicationController
  # GET /hasil2s
  # GET /hasil2s.json
  def index
    @hasil2s = Hasil2.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hasil2s }
    end
  end

  # GET /hasil2s/1
  # GET /hasil2s/1.json
  def show
    @hasil2 = Hasil2.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hasil2 }
    end
  end

  # GET /hasil2s/new
  # GET /hasil2s/new.json
  def new    
    @hasil2 = Hasil2.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hasil2 }
    end
  end

  # GET /hasil2s/1/edit
  def edit
    @hasil2 = Hasil2.find(params[:id])    
  end

  # POST /hasil2s
  # POST /hasil2s.json
  def create
    @hasil2 = Hasil2.new(params[:hasil2])
    @pasien2 = Pasien2.find(params[:idpasien2])

    respond_to do |format|
      if @hasil2.save
        format.html { redirect_to @pasien2, notice: 'Hasil Pemeriksaan berhasil di tambah.' }
        #format.json { render json: @hasil2, status: :created, location: @hasil2 }
      else
        format.html { render action: "new" }
        format.json { render json: @hasil2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hasil2s/1
  # PUT /hasil2s/1.json
  def update
    @hasil2 = Hasil2.find(params[:id])
    @pasien2 = Pasien2.find(params[:idpasien2])

    respond_to do |format|
      if @hasil2.update_attributes(params[:hasil2])
        format.html { redirect_to @pasien2, notice: 'Hasil Pemeriksaan berhasil di updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hasil2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hasil2s/1
  # DELETE /hasil2s/1.json
  def destroy
    @hasil2 = Hasil2.find(params[:id])
    @pasien2id = Pasien2.find(params[:idpasien2])
    @hasil2.destroy

    respond_to do |format|
      format.html { redirect_to @pasien2id }
      format.json { head :no_content }
    end
  end

  # GET /hasil2s/new
  # GET /hasil2s/new.json
  def addnew
    if params[:itemperiksa]
      # using json
      #@lab2_item_selected = Lab2.where( :lab_item_report => params[:itemperiksa] ) #.pluck( :lab_satuan )          
      # using js
      @lab2_lab_satuan = Lab2.where( :lab_item_report => params[:itemperiksa] ).pluck( :lab_satuan )
      case params[:jenisk]
      when 1
        @lab2_batas_bawah = Lab2.where( :lab_item_report => params[:itemperiksa] ).pluck( :lab_batas_pl )
        @lab2_batas_atas = Lab2.where( :lab_item_report => params[:itemperiksa] ).pluck( :lab_batas_ph )
      else
        @lab2_batas_bawah = Lab2.where( :lab_item_report => params[:itemperiksa] ).pluck( :lab_batas_ll )
        @lab2_batas_atas = Lab2.where( :lab_item_report => params[:itemperiksa] ).pluck( :lab_batas_lh )
      end      
      @lab2_posisi_desimal = Lab2.where( :lab_item_report => params[:itemperiksa] ).pluck( :lab_posisi_desimal )
      @lab2_lab_item_order = Lab2.where( :lab_item_report => params[:itemperiksa] ).pluck( :lab_item_order )
      @lab2_lab_nilai_normal = Lab2.where( :lab_item_report => params[:itemperiksa] ).pluck( :lab_nilai_normal )
      @lab2_lab_harga = Lab2.where( :lab_item_report => params[:itemperiksa] ).pluck( :lab_item_harga )
      #@lab2_selected = lab2_item_selected.map do |u|
      #  { :labsatuan => u.lab_satuan }
      #end      
    else
      @pasien2 = Pasien2.where( :id => params[:id] )
      @hasil2 = Hasil2.new
      @lab2 = Lab2.pluck( :lab_item_report ).uniq
    end

    respond_to do |format|
      format.html 
      #format.json { render :json => @lab2_item_selected }
      format.json { render :json => { 
                    :labsatuan => @lab2_lab_satuan,
                    :labbataspl => @lab2_batas_bawah,
                    :labbatasph => @lab2_batas_atas,
                    :labposisidesimal => @lab2_posisi_desimal,
                    :labitemorder => @lab2_lab_item_order,
                    :labnilainormal => @lab2_lab_nilai_normal,
                    :labharga => @lab2_lab_harga
                    } }
      #format.js { render js: @lab2_item_selected }
    end
  end

end
