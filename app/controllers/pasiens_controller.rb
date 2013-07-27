class PasiensController < ApplicationController
  # GET /pasiens
  # GET /pasiens.json
  
  def search

  end

  def index    
    if params[:search]
      @pasiens = Pasien.search(params[:search]).order("created_at DESC")
    else
      @pasiens = Pasien.where("tanggal = '#{Date.today}'").order("created_at DESC")
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pasiens }
    end
  end

  # GET /pasiens/1
  # GET /pasiens/1.json
  def show
    @pasien = Pasien.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pasien }
    end
  end

  # GET /pasiens/new
  # GET /pasiens/new.json
  def new
    @pasien = Pasien.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pasien }
    end
  end

  # GET /pasiens/1/edit
  def edit
    @pasien = Pasien.find(params[:id])
  end

  # POST /pasiens
  # POST /pasiens.json
  def create
    @pasien = Pasien.new(params[:pasien])

    respond_to do |format|
      if @pasien.save
        format.html { redirect_to @pasien, notice: 'Pasien was successfully created.' }
        format.json { render json: @pasien, status: :created, location: @pasien }
      else
        format.html { render action: "new" }
        format.json { render json: @pasien.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pasiens/1
  # PUT /pasiens/1.json
  def update
    @pasien = Pasien.find(params[:id])

    respond_to do |format|
      if @pasien.update_attributes(params[:pasien])
        format.html { redirect_to @pasien, notice: 'Pasien was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pasien.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pasiens/1
  # DELETE /pasiens/1.json
  def destroy
    @pasien = Pasien.find(params[:id])
    @pasien.destroy

    respond_to do |format|
      format.html { redirect_to pasiens_url }
      format.json { head :no_content }
    end
  end
end
