class HasilsController < ApplicationController
  # GET /hasils
  # GET /hasils.json
  def index
    @hasils = Hasil.all
#
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hasils }
    end
  end

  # GET /hasils/1
  # GET /hasils/1.json
  def show
    @hasil = Hasil.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hasil }
    end
  end

  # GET /hasils/new
  # GET /hasils/new.json
  def new
    @hasil = Hasil.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hasil }
    end
  end

  # GET /hasils/1/edit
  def edit
    @hasil = Hasil.find(params[:id])
  end

  # POST /hasils
  # POST /hasils.json
  def create
    #@pasien = Pasien.find(params[:pasien_id])
    #@hasil = @pasien.hasils.create(params[:hasil])
    #redirect_to pasien_path(@post)
    @hasil = Hasil.create(params[:hasil])

    respond_to do |format|
      if @hasil.save
        format.html { redirect_to @hasil, notice: 'Hasil was successfully created.' }
        format.json { render json: @hasil, status: :created, location: @hasil }
      else
        format.html { render action: "new" }
        format.json { render json: @hasil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hasils/1
  # PUT /hasils/1.json
  def update
    @hasil = Hasil.find(params[:id])

    respond_to do |format|
      if @hasil.update_attributes(params[:hasil])
        format.html { redirect_to @hasil, notice: 'Hasil was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hasil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hasils/1
  # DELETE /hasils/1.json
  def destroy
    @hasil = Hasil.find(params[:id])
    @hasil.destroy

    respond_to do |format|
      format.html { redirect_to hasils_url }
      format.json { head :no_content }
    end
  end
end
