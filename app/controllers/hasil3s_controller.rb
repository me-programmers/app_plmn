class Hasil3sController < ApplicationController
  # GET /hasil3s
  # GET /hasil3s.json
  def index
    @hasil3s = Hasil3.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hasil3s }
    end
  end

  # GET /hasil3s/1
  # GET /hasil3s/1.json
  def show
    @hasil3 = Hasil3.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hasil3 }
    end
  end

  # GET /hasil3s/new
  # GET /hasil3s/new.json
  def new
    @hasil3 = Hasil3.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hasil3 }
    end
  end

  # GET /hasil3s/1/edit
  def edit
    @hasil3 = Hasil3.find(params[:id])
  end

  # POST /hasil3s
  # POST /hasil3s.json
  def create
    @hasil3 = Hasil3.new(params[:hasil3])

    respond_to do |format|
      if @hasil3.save
        format.html { redirect_to @hasil3, notice: 'Hasil3 was successfully created.' }
        format.json { render json: @hasil3, status: :created, location: @hasil3 }
      else
        format.html { render action: "new" }
        format.json { render json: @hasil3.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hasil3s/1
  # PUT /hasil3s/1.json
  def update
    @hasil3 = Hasil3.find(params[:id])

    respond_to do |format|
      if @hasil3.update_attributes(params[:hasil3])
        format.html { redirect_to @hasil3, notice: 'Hasil3 was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hasil3.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hasil3s/1
  # DELETE /hasil3s/1.json
  def destroy
    @hasil3 = Hasil3.find(params[:id])
    @hasil3.destroy

    respond_to do |format|
      format.html { redirect_to hasil3s_url }
      format.json { head :no_content }
    end
  end
end
