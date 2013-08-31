class Pasien2sController < ApplicationController
  # GET /pasien2s
  # GET /pasien2s.json
  def index
    if params[:search].present? && params[:search_idname].blank?
      @pasien2s = Pasien2.search(params[:search]).order("nama_pasien")
    elsif params[:search].blank? && params[:search_idname].present?
      @pasien2s = Pasien2.searchidname(params[:search_idname]).order("nama_pasien")      
    elsif params[:search].present? && params[:search_idname].present?
      @pasien2s = Pasien2.searchtglidname(params[:search], params[:search_idname]).order("nama_pasien")      
    else
      @pasien2s = Pasien2.where("tanggal = '#{Date.today}'").order("nama_pasien")
      #@pasien2s = Pasien2.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pasien2s }
    end
  end

  # GET /pasien2s/1
  # GET /pasien2s/1.json
  def show
    @pasien2 = Pasien2.find(params[:id])
    @hasil2 = Hasil2.where( :hsl_echantillon => @pasien2.id_echantillon )

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pasien2 }
      format.pdf do
        pdf = ReportPdf.new(@pasien2, current_user.name)
        send_data pdf.render, :filename => 
        "Report_#{@pasien2.created_at.strftime("%d/%m/%Y")}.pdf", :type => "application/pdf", :disposition => "inline"                  
      end
    end
  end

  def shownota
    @pasien2 = Pasien2.find(params[:id])
    @hasil2 = Hasil2.where( :hsl_echantillon => @pasien2.id_echantillon )

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pasien2 }
      format.pdf do
        pdf = ReportnotaPdf.new(@pasien2, current_user.name)
        send_data pdf.render, :filename => 
        "Report_Nota#{@pasien2.created_at.strftime("%d/%m/%Y")}.pdf", :type => "application/pdf", :disposition => "inline"       
      end
    end
  end
  # GET /pasien2s/new
  # GET /pasien2s/new.json
  def new
    @pasien2 = Pasien2.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pasien2 }
    end
  end

  # GET /pasien2s/1/edit
  def edit
    @pasien2 = Pasien2.find(params[:id])
  end

  # POST /pasien2s
  # POST /pasien2s.json
  def create
    @pasien2 = Pasien2.new(params[:pasien2])

    respond_to do |format|
      if @pasien2.save
        format.html { redirect_to @pasien2, notice: 'Data pasien berhasil di tambah.' }
        format.json { render json: @pasien2, status: :created, location: @pasien2 }
      else
        format.html { render action: "new" }
        format.json { render json: @pasien2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pasien2s/1
  # PUT /pasien2s/1.json
  def update
    @pasien2 = Pasien2.find(params[:id])

    respond_to do |format|
      if @pasien2.update_attributes(params[:pasien2])
        format.html { redirect_to @pasien2, notice: 'Data pasien berhasil di update.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pasien2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pasien2s/1
  # DELETE /pasien2s/1.json
  def destroy
    @pasien2 = Pasien2.find(params[:id])
    @pasien2.destroy

    respond_to do |format|
      format.html { redirect_to :action => "index", :search => params[:search] }
      format.json { head :no_content }
    end
  end
end
