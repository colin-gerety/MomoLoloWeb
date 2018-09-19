class BaristasController < ApplicationController
  before_action :set_barista, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, :except => [:show, :index]

  # GET /baristas
  # GET /baristas.json
  def index
    @baristas = Barista.all
  end

  # GET /baristas/1
  # GET /baristas/1.json
  def show
    @barista_display_photos = @barista.barista_photos.where(can_display: true).where.not(image: [nil, ""]).order(created_at: :desc)
  end

  # GET /baristas/new
  def new
    @barista = Barista.new
  end

  # GET /baristas/1/edit
  def edit
  end

  # POST /baristas
  # POST /baristas.json
  def create
    @barista = Barista.new(barista_params)

    respond_to do |format|
      if @barista.save
        format.html { redirect_to @barista, notice: 'Barista was successfully created.' }
        format.json { render :show, status: :created, location: @barista }
      else
        format.html { render :new }
        format.json { render json: @barista.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /baristas/1
  # PATCH/PUT /baristas/1.json
  def update
    respond_to do |format|
      if @barista.update(barista_params)
        format.html { redirect_to @barista, notice: 'Barista was successfully updated.' }
        format.json { render :show, status: :ok, location: @barista }
      else
        format.html { render :edit }
        format.json { render json: @barista.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /baristas/1
  # DELETE /baristas/1.json
  def destroy
    @barista.destroy
    respond_to do |format|
      format.html { redirect_to baristas_url, notice: 'Barista was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barista
      @title = 'Fort Collins Best Baristas'
      @barista = Barista.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def barista_params
      params.require(:barista).permit(:first, :last, :currently_working, :tag_line)
    end
end
