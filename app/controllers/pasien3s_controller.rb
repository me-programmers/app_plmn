class Pasien3sController < ApplicationController

  helper_method :sort_column, :sort_direction

  # GET /pasien3s
  # GET /pasien3s.json
  def index
    #if params[:search]
    #  @pasien3s = Pasien3.search(params[:search]).order("created_at DESC")
    #else
    #  @pasien3s = Pasien3.where("tanggal = '#{Date.today}'").order("created_at DESC")
    #  #@pasien2s = Pasien2.all
    #end

    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @pasien3s }
    #end
    @ajax_search = params[:ajax_search] == "true" ? true : false
    
    puts "sort_direction = " + sort_direction
        
    @pasien3s = Pasien3.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.js   # index.js.erb
      format.json { render json: @pasien3s }
    end
  end

  # GET /pasien3s/1
  # GET /pasien3s/1.json
  def show
    @pasien3 = Pasien3.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pasien3 }
      format.pdf do
        pdf = Report3Pdf.new(@pasien3)
        send_data pdf.render, :filename => 
        "Report_#{@pasien3.created_at.strftime("%d/%m/%Y")}.pdf", :type => "application/pdf", :disposition => "inline"
      end
    end
  end

  # GET /pasien3s/new
  # GET /pasien3s/new.json
  def new
    @pasien3 = Pasien3.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pasien3 }
    end
  end

  # GET /pasien3s/1/edit
  def edit
    @pasien3 = Pasien3.find(params[:id])
  end

  # POST /pasien3s
  # POST /pasien3s.json
  def create
    @pasien3 = Pasien3.new(params[:pasien3])

    respond_to do |format|
      if @pasien3.save
        format.html { redirect_to @pasien3, notice: 'Pasien3 was successfully created.' }
        format.json { render json: @pasien3, status: :created, location: @pasien3 }
      else
        format.html { render action: "new" }
        format.json { render json: @pasien3.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pasien3s/1
  # PUT /pasien3s/1.json
  def update
    @pasien3 = Pasien3.find(params[:id])

    respond_to do |format|
      if @pasien3.update_attributes(params[:pasien3])
        format.html { redirect_to @pasien3, notice: 'Pasien3 was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pasien3.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pasien3s/1
  # DELETE /pasien3s/1.json
  def destroy
    @pasien3 = Pasien3.find(params[:id])
    @pasien3.destroy

    respond_to do |format|
      format.html { redirect_to pasien3s_url }
      format.json { head :no_content }
    end
  end

  private  
  def sort_column
   # column varmi diye kontrol ediliyor, yoksa name default   
   Pasien3.column_names.include?(params[:sort]) ? params[:sort] : "nama_pasien"   
  end  
 
  # sort icin default direction asc
  def sort_direction
    # karakter kontrol yapiliyor security icin  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"    
  end   

end
