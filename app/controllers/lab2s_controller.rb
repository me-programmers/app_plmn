class Lab2sController < ApplicationController
  # GET /lab2s
  # GET /lab2s.json
  def index
    @lab2s = Lab2.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lab2s }
    end
  end

  # GET /lab2s/1
  # GET /lab2s/1.json
  def show
    @lab2 = Lab2.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lab2 }
    end
  end

  # GET /lab2s/new
  # GET /lab2s/new.json
  def new
    @lab2 = Lab2.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lab2 }
    end
  end

  # GET /lab2s/1/edit
  def edit
    @lab2 = Lab2.find(params[:id])
  end

  # POST /lab2s
  # POST /lab2s.json
  def create
    @lab2 = Lab2.new(params[:lab2])

    respond_to do |format|
      if @lab2.save
        format.html { redirect_to @lab2, notice: 'Item Lab berhasil di tambah.' }
        format.json { render json: @lab2, status: :created, location: @lab2 }
      else
        format.html { render action: "new" }
        format.json { render json: @lab2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lab2s/1
  # PUT /lab2s/1.json
  def update
    @lab2 = Lab2.find(params[:id])

    respond_to do |format|
      if @lab2.update_attributes(params[:lab2])
        format.html { redirect_to @lab2, notice: 'Item Lab berhasil di update.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lab2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lab2s/1
  # DELETE /lab2s/1.json
  def destroy
    @lab2 = Lab2.find(params[:id])
    @lab2.destroy

    respond_to do |format|
      format.html { redirect_to lab2s_url }
      format.json { head :no_content }
    end
  end
end
